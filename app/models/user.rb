class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable
  has_many :user_neighborhoods
  has_many :neighborhoods, through: :user_neighborhoodss

  has_many :user_groups
  has_many :groups, through: :user_groups do
    def leader_of
      where("user_groups.is_leader = ?", true)
    end
  end

  validates :email, presence: true

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
