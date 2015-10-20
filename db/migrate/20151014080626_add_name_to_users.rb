class AddNameToUsers < ActiveRecord::Migration
  def change
  	
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_column :users, :date_of_birth, :date
    add_column :users, :phone, :string
    add_column :users, :cell_phone, :string

  end
end
