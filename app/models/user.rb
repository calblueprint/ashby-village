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
#  phone                  :string
#  photo_file_name        :string
#  photo_content_type     :string
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  role                   :integer          default(0)
#  bio                    :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  full_name              :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :admins, -> { where(role: 1) }

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable, :registerable

  before_save :set_full_name

  enum role: [:member, :admin]
  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :user_groups
  has_many :groups, through: :user_groups do
    def leader_of
      where("user_groups.is_leader = ?", true)
    end
  end
  has_many :invites
  has_many :events, through: :invites do
    def rsvped_to
      where("invites.rsvp = ?", true)
    end
  end

  def is_attendee(event)
    (event.nil? ? false : event.users.exists?(id: id))
  end
  
  def is_organizer(event)
    (event.nil? ? false : event.users.organizers.exists?(id: id))
  end

  def is_leader(group)
    (group.nil? ? false : group.users.leaders.exists?(id: id))
  end

  def is_member(group)
    (group.nil? ? false : group.users.exists?(id: id))
  end

  def is_only_leader(group)
    self.is_leader(group) && group.users.leaders.count == 1
  end

  before_validation :strip_phone_number

  before_destroy { |user| UserGroup.destroy_all "user_id = #{user.id}" }

  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :first_name, presence: true
  validates :last_name, presence: true

  protected

  # strips phone number of masked input so that it is saved with only numbers
  # and so that we can validate that there are 10 numbers in the phone number (but doesn't validate that its real)
  def strip_phone_number
    (self.phone.nil? ? "          " : self.phone.gsub!(/[^0-9]/, ""))
  end

  #validates_length_of :phone, is: 10, message: "Invalid phone number. Don't forget to include your area code!"

  has_attached_file :photo, styles: { medium: "500x500>", thumb: "150x150#" },
                            default_url: "https://s3-us-west-1.amazonaws.com/ashby-prod/default.png"
  validates_attachment_content_type :photo, content_type: %r{^image\/(png|gif|jpeg|jpg)}

  private

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end
end
