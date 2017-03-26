class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |val, index|
      if index % 5 == 0
        val.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
