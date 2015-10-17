class CreateUserNeighborhoods < ActiveRecord::Migration
  def change
    create_table :user_neighborhoods do |t|

      t.timestamps null: false
    end
  end
end
