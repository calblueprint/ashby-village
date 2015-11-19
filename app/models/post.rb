class Post < ActiveRecord::Base
  # validates :user_id, presence: true
  # validates :content, presence: true
  scope :newest_first, -> { order(:created_at).reverse_order }

  belongs_to :user
  belongs_to :group
end
