class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :replies, [:user_id, :post_id, :group_id, :created_at], :name => 'user_post_group_created_at_index'
  end
end
