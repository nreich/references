require 'spec_helper'

describe ProjectsController do
  render_views

  before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
   end

  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = {:name => ""}
      end
      
      it "should not create a project" do
        lambda do
          post :create, :project => @attr
        end.should_not change(Project, :count)
      end
           
    end
    
    describe "success" do
      
      before(:each) do
        @attr = {:name => "sample project"}
      end
      
      it "should create a new project" do
        lambda do
          request.env["HTTP_REFERER"] = "/"
          post :create, :project => @attr
        end.should change(Project, :count).by(1)
      end
      
    end
    
  end
    

end
