class PagesController < ApplicationController
skip_before_filter :require_signed_in, :only => [ :sign_up, :sign_in ]

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
