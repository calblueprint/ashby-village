class AddStateToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :state, :integer
  end
end
