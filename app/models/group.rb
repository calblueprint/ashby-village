class Group < ActiveRecord::Base
	belongs_to :neighborhood

	has_many :user_groups
	has_many :users, through: :user_groups

end
