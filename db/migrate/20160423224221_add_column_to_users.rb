class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :global_email_notifications, :boolean, default: true
  end
end
