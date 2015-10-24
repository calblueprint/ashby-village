class RemoveConfirmationTokenFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string
  end

  def down
    remove_index :users, :confirmation_token, :users
  end
end
