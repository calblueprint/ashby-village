class AddNeighborhoodToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :neighborhood, :integer
  end
end
