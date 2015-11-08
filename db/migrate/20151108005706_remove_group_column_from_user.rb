class RemoveGroupColumnFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :group
  end
end
