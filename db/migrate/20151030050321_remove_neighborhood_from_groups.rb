class RemoveNeighborhoodFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :neighborhood, :string
  end
end
