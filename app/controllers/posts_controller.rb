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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error, please try again"
      render :edit
    end

  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully"
      redirect_to posts_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
end
