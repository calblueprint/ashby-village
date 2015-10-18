class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
