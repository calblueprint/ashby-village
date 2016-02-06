class RemoveCellPhoneFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :cell_phone, :string
  end
end
