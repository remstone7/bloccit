# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

50.times do
  # ! raises error if there is problem w/ data
  Post.create!(
    # call from lib_random_data
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
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
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

puts "#{Advertisement.count} before"
5.times do
  Advertisement.create!(
    title: RandomData.random_word,
    body: RandomData.random_sentence,
    price: RandomData.random_integer
  )
end
puts "#{Advertisement.count} after"
