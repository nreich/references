class PagesController < ApplicationController
skip_before_filter :require_signed_in, :only => [ :sign_up, :sign_in ]

  def home
  @title = "Home"
  @project = Project.find(:all)
  @citation = Citation.limit(25).order("created_at DESC").find(:all)
  end

  def sign_up
  @title = "Sign Up"
  end

  def sign_in
  @title = "Sign In"
  end
end
