class Tag < ActiveRecord::Base

  has_many :post_taggings, class_name: "PostTag", dependent: :destroy
  has_many :tagged_posts, through: :post_taggings, source: :post

  # In this case when we go looking for source we need to specify authors
  # because thats the has_many relation in the Post model that we're going
  # to chain off of to get to users
  has_many :authors_of_tagged_posts, through: :tagged_posts, source: :authors
end
