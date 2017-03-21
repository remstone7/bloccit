require 'rails_helper'
# describe the subject of the controller
RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      # call index method of WelcomeController
      get :index
      # expect the controllers response to render the index template
      expect(response).to render_template("index")
    end
  end

  describe "GET about" do
    it "renders the about template" do
      # call about method of WelcomeController
      get :about
      # expect the controllers response to render the inde template
      expect(response).to render_template("about")
    end
  end

end
