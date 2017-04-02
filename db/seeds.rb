# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

15.times do
  Topic.create!(
  name: RandomData.random_sentence,
  description: RandomData.random_paragraph
  )
end
topics = Topic.all

50.times do
  # ! raises error if there is problem w/ data
  Post.create!(
    topic: topics.sample,
    # call from lib_random_data
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
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
    # sameple - pick random post to associate com w/
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end


puts "Seed finsihed"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
50.times do
  Question.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: RandomData.random_boolean
  )
end
