require 'spec_helper'

describe ProjectsController do
  render_views

  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
    end
    
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
        @attr = {:name => "sampel project"}
      end
      
      it "should create a new project" do
        lambda do
          post :create, :project => @attr
        end.should change(Project, :count).by(1)
      end
      
    end
    
  end

end
