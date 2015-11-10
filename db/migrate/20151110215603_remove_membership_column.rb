class RemoveMembershipColumn < ActiveRecord::Migration
  def change
    remove_column :users_groups, :is_member, :boolean
  end
end
