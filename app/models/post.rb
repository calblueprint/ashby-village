# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  title      :text
#

class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true

  # This will allow order_by_created_at to work, as well as order_by_created_at(:asc)
  scope :order_by_created_at, -> (direction = :desc) { order(created_at: direction) }
  has_many :replies, dependent: :destroy
  belongs_to :user
  belongs_to :group
  belongs_to :event
end
