require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question) {Question.create!(title: "New Post Title", body: "New POst Body")}
  let(:answer) {Answer.create!(body: "Comment body", post: post)}

  describe "attributes" do
    it "has a body attribute" do
      expect(answer).to have_attributes(body: "Comment body")
    end
  end
end
