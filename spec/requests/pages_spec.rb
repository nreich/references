require 'spec_helper'

describe "Pages" do

  describe "when logged in" do
      
    before(:each) do
      @user = Factory(:user)
      visit sign_in_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    describe "GET 'home'" do
      
      it "should return http success" do
        get '/'
        response.should be_success
      end
      
      it "should have the right title" do
        get '/'
        response.should have_selector("title", 
                                :content => "Ardelyx Reference Navigator | Home")
      end
      
      it "should have a references title search" do
        get '/'
        response.should have_selector("label", :content => "Title")
      end
      
    end
    
  end
  
end