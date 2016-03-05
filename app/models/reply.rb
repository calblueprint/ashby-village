# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  post_id    :integer
#  group_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reply < ActiveRecord::Base
  scope :order_by_created_at, -> (direction = :asc) { order(created_at: direction) }
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :post
  belongs_to :user
  belongs_to :group
end
