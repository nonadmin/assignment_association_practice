class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :category

  # Post has a many to many relationship with both tags and users
  # and its THROUGH posts that we ultimately chained the relationship to get
  # a user's tags and vice-versa.
  has_many :post_taggings, class_name: "PostTag", dependent: :destroy
  has_many :tags, through: :post_taggings

  has_many :post_authorings, class_name: "PostUser", dependent: :destroy
  has_many :authors, through: :post_authorings, source: :user
end
