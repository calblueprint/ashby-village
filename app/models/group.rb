class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged

  enum kind: [:social, :neighborhood, :committee]

  belongs_to :neighborhood

  has_many :user_groups
  has_many :users, through: :user_groups do
    def leaders
      where("user_groups.is_leader = ?", true)
    end
  end

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def add_user(current_user, make_leader=false)
    UserGroup.create(user: current_user, group: self, is_leader: make_leader)
  end
end
