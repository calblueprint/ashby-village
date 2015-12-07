# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  date_of_birth          :date
#  phone                  :string
#  cell_phone             :string
#  photo_file_name        :string
#  photo_content_type     :string
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  neighborhood           :string
#


# TODO (Shannon): Remove cell-phone number field. Remove date of birth field?
class User < ActiveRecord::Base
  # searchkick autocomplete: ['first_name', 'last_name']
  def full_name
    [first_name, last_name].join(' ')
  end

  searchkick text_middle: ['full_name'], autocomplete: ['full_name']

  def search_data
    {
      full_name: full_name
    }
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :is_admin, -> { where(role: 1) }

  # TODO (Shannon): add phone number validation, length and integers

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  enum role: [:member, :admin]

  # TODO: Remove neighborhood model
  has_many :user_neighborhoods
  has_many :posts, dependent: :destroy
  has_many :neighborhoods, through: :user_neighborhoods
  has_many :user_groups
  has_many :groups, through: :user_groups do
    def leader_of
      where("user_groups.is_leader = ?", true)
    end
  end

  def is_leader(group)
    group.users.leaders.exists?(id: id)
  end

  def is_member(group)
    group.users.exists?(id: id)
  end

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy

  validates :email, presence: true

  has_attached_file :photo, :styles => { :medium => "500x500>", :thumb => "150x150#" }, default_url: "default.png"
  validates_attachment_content_type :photo, :content_type => /^image\/(png|gif|jpeg|jpg)/
end
