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

FactoryGirl.define do
  factory :group do
    description "Here is a test group"
    sequence(:name) { |n| "Test group #{n}" }
    # create neighborhood factory
    neighborhood 1
  end
end
