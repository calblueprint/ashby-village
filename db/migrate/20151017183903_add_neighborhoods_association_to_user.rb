class AddNeighborhoodsAssociationToUser < ActiveRecord::Migration
  def self.up
      add_column :neighborhoods, :user, :string
  end

  def self.down
      remove_column :neighborhoods, :user
  end
end
