def test
  render = []
  render << User.all << Comment.all << Post.all << Category.all << Tag.all
  render << User.first.comments

  render.each do |item|
    puts Hirb::Helpers::AutoTable.render(item)
    gets
  end
end

# Set a comment to belong to a different user
cc = Comment.first
uu = User.first
cc.author=(uu)
cc.save

# Set a post to a different category
cata = Category.first
pp = Post.first
pp.category=(cata)
pp.save

# Set a collection of comments to replace a user's current comments
uu = User.first
all_comments = Comment.all
new_comments = [all_comments.sample, all_comments.sample, all_comments.sample]
uu.authored_comments=(new_comments)
# Created orphans of replaced comments :(
uu.save

# List a given posts comments
pp = Post.first
pp.comments

# Return a given comment's parent post
cc = all_comments.sample
cc.post

# Remove one post from a category's collection of posts
cata = Category.all.sample
cata.posts.delete(cata.posts.first)

# List the posts authored by a given user
User.first.authored_posts

# List the IDs of all posts authored by a given user (hint: there's an association method for this)
User.first.authored_post_ids

# Set a collection of Posts to replace that user's currently authored posts
uu = User.first
all_posts = Post.all
new_posts = [all_posts.sample, all_posts.sample, all_posts.sample]
uu.authored_posts=(new_posts)
# Created orphans of replaced posts :(
uu.save

# List the authors of a given post
Post.first.authors

# Set a collection of Users to replace a given Post's authors
pp = Post.all.sample
pp.authors=(User.take(3))
pp.save

# Accomplish the same thing by only using IDs
pp = Post.all.sample
pp.author_ids=(User.ids.shuffle.take(3))
pp.save

# List the posts under a given tag
Tag.first.tagged_posts

# Add a new post to a given tag by only using its ID
tt = Tag.all.sample
tt.tagged_post_ids= (tt.tagged_post_ids << Post.ids.sample)
tt.save

# Add a new tag to a given post by only using its ID
pp = Post.all.sample
pp.tag_ids= (pp.tag_ids << Tag.ids.sample)
pp.save