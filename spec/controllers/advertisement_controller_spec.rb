require 'rails_helper'

RSpec.describe AdvertisementController, type: :controller do

  let(:new_advertisement) {Advertisement.create!(title: RandomData.random_word, body: RandomData.random_sentence, price: RandomData.random_integer )}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [new_advertisement] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([new_advertisement])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: new_advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "returns #show view" do
      get :show, {id: new_advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns new_advertisement to @advertisement" do
      get :show, {id: new_advertisement.id}
      expect(assigns(:advertisement)).to eq(new_advertisement)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
