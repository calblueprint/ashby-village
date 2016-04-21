class RemoveKindFromGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :kind, :integer
  end
end
