class SessionsController < ApplicationController
skip_before_filter :require_signed_in
  def new
    @title = "Sign In"
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email address or password"
      @title = "Sign In"
      render 'new'
    else
      sign_in(user)
      redirect_to root_url
    end
  end
  
  def destroy
    session[:user_id] = nil
    render 'new'
  end
end