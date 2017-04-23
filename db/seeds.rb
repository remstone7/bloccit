# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

# create users
5.times do
  User.create!(
    name: RandomData.random_name,
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  # ! raises error if there is problem w/ data
  post = Post.create!(
    user: users.sample,
    topic: topics.sample,
    # call from lib_random_data
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)

  rand(1..5).times { post.votes.create!(value: [-1,1].sample, user: users.sample)}
end

25.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_number
  )
end
posts = Post.all

100.times do
  Comment.create!(
    user: users.sample,
    # sameple - pick random post to associate com w/
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

50.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end

admin = User.create!(
  name: 'Admin User',
  email: 'admin@admin.com',
  password: 'helloworld',
  role: 'admin'
)
member = User.create!(
  name: 'Member user',
  email: 'member@member.com',
  password: 'helloworld'
)




puts "Seed finsihed"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Vote.count} votes created"
