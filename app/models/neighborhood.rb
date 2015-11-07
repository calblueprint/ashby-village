class Neighborhood < ActiveRecord::Base
  has_many :user_neighborhoods
  has_many :users, through: :user_neighborhoods

  has_many :groups
  validates_uniqueness_of :name, :message => '%{value} already exists as a neighborhood!'
end
