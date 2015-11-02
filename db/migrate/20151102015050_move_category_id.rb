class MoveCategoryId < ActiveRecord::Migration
  def change
    remove_column :categories, :post_id, :integer
    add_column :posts, :category_id, :integer
    add_index :posts, :category_id
  end
end
