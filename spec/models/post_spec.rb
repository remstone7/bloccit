require 'rails_helper'

RSpec.describe Post, type: :model do
  # create new instance of post (let dynamically defines :post method)
  # and upon first call within a spec (it block) computes and return value
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body")}
  # test post has attribute title and body
  # should return post.title and post.body
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")

    end
  end
end
