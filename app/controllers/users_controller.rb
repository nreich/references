class UsersController < ApplicationController
  def new
    @user = User.new
    @title = "Sign Up"
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #add code for successful user creation
    else
      @title = "Sign Up"
      render 'new'
    end
  end
end
