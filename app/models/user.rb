class User < ActiveRecord::Base
  has_many :authored_comments, foreign_key: :author_id, class_name: "Comment",
           dependent: :destroy

  # Renamed the join_table/model so we need to specify that as a
  # class_name here
  has_many :post_authorings, class_name: "PostUser", dependent: :destroy

  # Renamed posts, which we derive from the join_table and so we specify
  # source here (otherwise rails goes looking for a column like "authored_post_id")
  has_many :authored_posts, through: :post_authorings, source: :post

  # Finally same prinicle here (renamed tags) EXCEPT we need to look at the 
  # post model to determine what our source is here
  has_many :tags_on_authored_posts, through: :authored_posts, source: :tags
end
