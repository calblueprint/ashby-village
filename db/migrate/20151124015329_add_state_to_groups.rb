class AddStateToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :state, :integer, default: 1
  end
end
