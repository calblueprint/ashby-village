class AddGroupIdToUser < ActiveRecord::Migration
  def change
  	add_column :user, :group_id, :integer
  end


end
