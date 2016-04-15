class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :repeat_weekly, :boolean, default: false
    add_column :events, :repeat_monthly, :boolean, default: false
  end
end
