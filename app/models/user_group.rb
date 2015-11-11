# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :integer
#  user_id    :integer
#  is_leader  :boolean
#

class UserGroup < ActiveRecord::Base
	belongs_to :user
	belongs_to :group
end
