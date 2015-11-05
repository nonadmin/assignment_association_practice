class RenameJoinTables < ActiveRecord::Migration
  def change
    rename_table :post_authors, :post_users
    rename_table :post_taggings, :post_tags
  end
end
