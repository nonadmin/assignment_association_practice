class User < ActiveRecord::Base
  has_many :comments, foreign_key: :author_id

  has_and_belongs_to_many :posts, join_table: :post_authors
end
