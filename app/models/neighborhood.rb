class Neighborhood < ActiveRecord::Base
  has_many :user_neighborhoods
  has_many :users, through: :user_neighborhoods

  has_many :groups
end
