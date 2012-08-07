require 'spec_helper'

describe CategoriesController do
  render_views
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
      @citation = FactoryGirl.create(:citation)
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = {:name => ""}
      end
      
      it "should not create a category" do
        lambda do
          post :create, :category => @attr, :citation_id => @citation.id
        end.should_not change(Category, :count)
      end
      

           
    end
    
    describe "success" do
      
      before(:each) do
        @attr = {:name => "sample category"}
      end
      
      it "should create a new category" do
        lambda do
          post :create, :category => @attr, :citation_id => @citation.id
        end.should change(Category, :count).by(1)
      end
      
    end
    
  end
end
