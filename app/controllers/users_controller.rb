class UsersController < ApplicationController
   def new
     @user = User.new
   end

  #  def create
  #   #  create the new user and set w/ corresponding att from params hash
  #     @user = User.new
  #     @user.name = params[:user][:name]
  #     @user.email = params[:user][:email]
  #     @user.password = params[:user][:password]
  #     @user.password_confirmation = params[:user][:password_confirmation]
   #
  #     # save user to db
  #     if @user.save
  #       flash[:notice] = "Welcome to Bloccit #{@user.name}!"
  #       redirect_to root_path
  #     else
  #       flash.now[:alert] = "There was an error reating your account. Please try again"
  #       render :new
  #     end
  #  end

 end
