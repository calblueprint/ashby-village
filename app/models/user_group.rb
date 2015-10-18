class UserGroup < ActiveRecord::Base
	belongs_to :users
	belongs_to :groups
end
