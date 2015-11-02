class CreatePostAuthors < ActiveRecord::Migration
  def change
    create_table :post_authors do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end

    add_index :post_authors, [:user_id, :post_id], unique: true
  end
end
