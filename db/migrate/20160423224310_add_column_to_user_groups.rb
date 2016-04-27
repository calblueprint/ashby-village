class AddColumnToUserGroups < ActiveRecord::Migration
  def change
    add_column :user_groups, :group_email_notifications, :boolean, default: true
  end
end
