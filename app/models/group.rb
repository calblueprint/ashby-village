# == Schema Information
#
# Table name: groups
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  description        :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  slug               :string
#  state              :integer          default(1)
#  neighborhood       :integer
#
class Group < ActiveRecord::Base
  validates_uniqueness_of :name
  validates :name, presence: true
  validates :description, presence: true

  scope :alphabetized, -> { order(name: :asc) }

  enum state: [:inactive, :active]
  enum neighborhood: [:'Kensington Kaleidoscope', :'Ashby Village',
                      :Outlandish, :'Thousand Oaks Hamlet', :Emeryville, :Midlandish,
                      :'North Berkeley Hills', :'Claremont-Elmwood']

  has_many :user_groups
  has_many :users, through: :user_groups do
    def leaders
      where("user_groups.is_leader = ?", true)
    end
  end

  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy do
    def group_posts
      where("groups")
    end
  end
  has_many :replies, dependent: :destroy

  has_attached_file :photo, styles: { medium: "500x500>", thumb: "150x150#" }, default_url: ActionController::Base.helpers.asset_path("empty_group.png")
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  
  before_destroy { |group| UserGroup.destroy_all "group_id = #{group.id}" }
  before_destroy { |group| Event.destroy_all "group_id = #{group.id}" }
  
  def search_display
    name + " in " + neighborhood
  end

  def has_one_leader
    users.leaders.count == 1
  end

  def add_user(user, make_leader = false)
    if UserGroup.where(user: user, group: self).first.nil?
      UserGroup.create(user: user, group: self, is_leader: make_leader)
    else
      UserGroup.where(user: user, group: self).first.update_attribute :is_leader, make_leader
    end
  end

  def remove_leader(user)
    if !UserGroup.where(user: user, group: self).first.nil?
      UserGroup.where(user: user, group: self).first.update_attribute(:is_leader, false)
    end
    if users.leaders.count == 0
    end
  end

  def set_inactive
    self.update_attribute :state, 0
    Event.destroy_all "group_id = #{self.id}"
  end

  def remove_user(user)
    # If the current user is the only leader, make the group inactive
    if user.is_only_leader(self)
      set_inactive
    end
    self.users.delete(user)
  end
end
