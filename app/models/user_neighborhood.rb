# == Schema Information
#
# Table name: user_neighborhoods
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  neighborhood_id :integer
#  user_id         :integer
#

class UserNeighborhood < ActiveRecord::Base
	belongs_to :user
	belongs_to :neighborhood
end
