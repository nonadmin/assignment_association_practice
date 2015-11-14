class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :post
  belongs_to :parent_post, class_name: "Post", foreign_key: :post_id

  validates :author_id, :body, presence: true
end
