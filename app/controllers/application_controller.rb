class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :require_signed_in
  
private

  def require_signed_in
    unless current_user
      redirect_to sign_in_url
    end
  end
end
