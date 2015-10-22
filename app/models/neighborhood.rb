class Neighborhood < ActiveRecord::Base
  has_many :user_neighborhoods
  has_many :users, through: :user_neighborhoods

  validates_uniqueness_of :title, :message => "this Neighborhood already exists!"
  has_many :groups
end
