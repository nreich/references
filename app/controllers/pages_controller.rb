class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def sign_up
  @title = "Sign Up"
  end

  def sign_in
  @title = "Sign In"
  end
end
