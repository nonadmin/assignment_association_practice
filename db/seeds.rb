User.destroy_all
Post.destroy_all
Tag.destroy_all
Category.destroy_all
Comment.destroy_all

10.times do |i|
  User.create!(name: "Dude#{i}")
end

10.times do 
  Category.create!(name: Faker::Company.buzzword)
end
categories = Category.all

20.times do
  Tag.create!(name: Faker::Hacker.adjective)
end
tags = Tag.all

users = User.all
users.each do |user|
  5.times do
    user.authored_posts.create!(title: Faker::Book.title, body: Faker::Company.bs, 
                       category: categories.sample)
  end
end

posts = Post.all
posts.each do |post|
  rand(5).times do
    begin
      post.authors << users.sample
      post.tags << tags.sample
      post.comments.create!(body: Faker::Company.bs, author: users.sample)
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid
      retry
    end
  end
end