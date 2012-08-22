class UsersController < ApplicationController
    skip_before_filter :require_signed_in, :only => [ :new, :create ]
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
      sign_in @user
      flash[:success] = "Welcome to Ardelyx Reference Navigator"
      redirect_to root_path
    else
      @title = "Sign Up"
      render 'new'
    end
  end
end
