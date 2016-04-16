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
#  event_id   :integer
#

FactoryGirl.define do
  factory :post do
    user
    title "Test post title"
    content "Test post content"
  end
end
