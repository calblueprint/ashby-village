class Reply < ActiveRecord::Base
  scope :order_by_created_at, -> (direction = :desc) { order(created_at: direction) }
  validates :content, presence: true
  belongs_to :post
  belongs_to :user
  belongs_to :group
end
