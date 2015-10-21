class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
