class RemoveNeighborhoodIdFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :neighborhood_id, :integer
  end
end
