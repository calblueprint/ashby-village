class RenameUserGroups < ActiveRecord::Migration
  def change
    rename_table :user_groups, :users_groups
  end
end
