# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location    :string
#  group_id    :integer
#

class Neighborhood < ActiveRecord::Base
  has_many :user_neighborhoods
  has_many :users, through: :user_neighborhoods

  has_many :groups
  validates_uniqueness_of :name, :message => '%{value} already exists as a neighborhood!'
end
