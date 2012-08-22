require 'spec_helper'

describe "Users" do
  
  describe "signup" do
  
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit sign_up_path
          fill_in "First Name", :with => ""
          fill_in "Last Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanations")
        end.should_not change(User, :count)
      end
    end
    
    describe "success" do
    
      it "should make a new user" do
        lambda do
          visit sign_up_path
          fill_in "First Name", :with => "Sample"
          fill_in "Last Name", :with => "User"
          fill_in "Email", :with => "suser@ardelyx.com"
          fill_in "Password", :with => "secret"
          fill_in "Confirmation", :with => "secret"
          click_button
          current_url.should == root_url
        end.should change(User, :count).by(1)
      end
      
    end
  end
end
