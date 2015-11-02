class CategoryPostsRelationship < ActiveRecord::Migration
  def change
    add_column :categories, :post_id, :integer
    add_index :categories, :post_id  
  end
end
