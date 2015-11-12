class RemoveMembershipColumn < ActiveRecord::Migration
  def change
    remove_column :user_groups, :is_member, :boolean
  end
end
