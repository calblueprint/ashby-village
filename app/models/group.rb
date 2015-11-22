# == Schema Information
#
# Table name: groups
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  neighborhood_id    :integer
#  description        :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  slug               :string
#  kind               :integer
#

class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  # validates :name, uniqueness: true, on: :create
  validates_uniqueness_of :name

  enum kind: [:social, :neighborhood, :committee]
  enum state: [:inactive, :active]

  belongs_to :neighborhood

  has_many :user_groups
  has_many :users, through: :user_groups do
    def leaders
      where("user_groups.is_leader = ?", true)
    end
  end

  has_many :posts, dependent: :destroy

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def add_user(current_user, make_leader = false)
    UserGroup.create(user: current_user, group: self, is_leader: make_leader)
  end

  def has_one_leader
    users.leaders.count == 1
  end

  def remove_user(current_user)
    # If the current user is the only leader, make the group inactive
    if has_one_leader && current_user.is_leader(self)
      self.update_attribute :state, 0
    end
    self.users.delete(current_user)
  end
end
