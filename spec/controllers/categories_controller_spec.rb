require 'spec_helper'

describe CategoriesController do
  render_views
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
      @project = FactoryGirl.create(:project)
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = {:name => ""}
      end
      
      it "should not create a category" do
        lambda do
          post :create, :category => @attr, :project_id => @project.id
        end.should_not change(Category, :count)
      end
           
    end
    
    describe "success" do
      
      before(:each) do
        @attr = {:name => "sample category"}
      end
      
      it "should create a new category" do
        lambda do
          post :create, :category => @attr, :project_id => @project.id
        end.should change(Category, :count).by(1)
      end
      
    end
    
  end
end
