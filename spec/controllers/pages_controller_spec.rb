require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should return http success" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title", 
                              :content => "Ardelyx Reference Navigator | Home")
    end
  end

  describe "GET 'sign_up'" do
    it "should return http success" do
      get 'sign_up'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'sign_up'
      response.should have_selector("title", 
                            :content => "Ardelyx Reference Navigator | Sign Up")
    end
  end

  describe "GET 'sign_in'" do
    it "should return http success" do
      get 'sign_in'
      response.should be_success
    end
    it "should have the right title" do
      get 'sign_in'
      response.should have_selector("title", 
                            :content => "Ardelyx Reference Navigator | Sign In")
    end
  end

end
