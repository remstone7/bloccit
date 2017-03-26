require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:my_post) {Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
    end
  end

  describe "GET show" do
   it "returns http success" do
    #  show to return http success
     get :show, {id: my_post.id}
     expect(response).to have_http_status(:success)
   end

   it "renders the #show view" do
    #  return show view
     get :show, {id: my_post.id}
     expect(response).to render_template :show
   end
  #  post returned is the post we asked for
  it "assigns my_post to @post" do
     get :show, {id: my_post.id}
# #18
     expect(assigns(:post)).to eq(my_post)
   end
  end

  # GET request sends successfully
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    # expect PostsController#new to render the posts new view
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    # expect @post to be initialized
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
    # expect create to be called and posts will increase by 1
    it "increases the number of Post by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post, :count).by(1)
    end
    # newly created post to be asssigned to @post
    it "assigns the new post to @post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end
    # redirected to the newly created post
    it "redirects to the new post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end
  end

#  describe "GET edit" do
#    it "returns http success" do
#      get :edit
#      expect(response).to have_http_status(:success)
#    end
#  end

end
