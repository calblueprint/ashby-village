class AddForeignKeysToUserGroups < ActiveRecord::Migration
  def change
  	add_column :user_groups, :group_id, :integer
  	add_column :user_groups, :user_id, :integer
  	add_column :user_groups, :is_member, :boolean
  	add_column :user_groups, :is_leader, :boolean
  end
end
