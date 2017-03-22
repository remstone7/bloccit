require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "Question has title", body: "Question has body", resolved: true)}

  describe "attributes" do
    it "has title body and resolved attributes" do
      expect(question).to have_attributes(title: "Question has title", body: "Question has body", resolved: true)
    end
  end
end
