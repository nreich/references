require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Home")
    end
    
    it "should have a Sign In page at '/sign_in'" do
      get '/sign_in'
      response.should have_selector('title', :content => "Sign In")
    end
    
    it "should have a Sign Up page at '/sign_up'" do
      get '/sign_up'
      response.should have_selector('title', :content => "Sign Up")
    end
    
  end
end
