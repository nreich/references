require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
    
    it "should have a Sign In page at '/sign_in'" do
      get '/sign_in'
      response.should have_selector('title', :content => "Sign In")
    end
    
    it "should have a Sign Up page at '/sign_up'" do
      get '/sign_up'
      response.should have_selector('title', :content => "Sign Up")
    end
    
  end
  
  describe "when not signed in" do
  
    it "should have a signin link" do
      visit sign_in_path
      response.should have_selector("a", :href => sign_in_path,
                                         :content => "Sign In")
    end
    
  end
  
  describe "when signed in" do
  
    before(:each) do
      @user = Factory(:user)
      visit sign_in_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
  
    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => sign_out_path,
                                         :content => "Sign Out")
    end
    
  end
  
end
