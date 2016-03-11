class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.time :starttime
      t.time :endtime
      t.date :startdate
      t.date :enddate
      t.references :group, index: true, foreign_key: true
      t.string :location

      t.timestamps null: false
    end
  end
end
