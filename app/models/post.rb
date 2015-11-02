class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :category

  # Post taggings has a model
  has_many :post_taggings
  has_many :tags, through: :post_taggings

  # Post authors does not, also from this side we want to say Post.authors
  # instead of Post.users.  Would have been easier to use the table name
  # rails is expecting - posts_users.
  has_and_belongs_to_many :authors, join_table: :post_authors, 
                          class_name: "User"
  
end
