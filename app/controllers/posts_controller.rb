class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # we call Post.new to create a new instance of Post.
    @post = Post.new

    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      # redirect user to post if successfully saved
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash.no[:alert] = "There was an error, please try again"
      render :new
    end
  end


  def edit
  end
end
