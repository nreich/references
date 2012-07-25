require 'spec_helper'

describe CommentsController do
  render_views
  
  describe "access control" do
    
    #This test (and the next test) should not be needed, as application controller
    #before_filter should prevent it
    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(sign_in_path)
    end
    
    it "should deny acces to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(sign_in_path)
    end
    
  end
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = test_sign_in(FactoryGirl.create(:user))
    end
    
    describe "failure" do
      
      before(:each) do
        @citation = FactoryGirl.create(:citation)
        #passed is an empty comment, which should result in a failed comment creation
        #@attr = FactoryGirl.attributes_for(:comment, :citation_id => @citation.id)
        @attr = {:content => ""}
      end
      
      it "should not create a comment" do
        lambda do
          post :create, :content => @attr, :citation_id => @citation.id
        end.should_not change(Comment, :count)
      end
      
      it "should redirect back to the citation" do
        post :create, :content => @attr, :citation_id => @citation.id
        response.should redirect_to(@citation)
      end
      
      
    end
    
    describe "success" do
      
      before(:each) do
        @citation = FactoryGirl.create(:citation)
        #passed is an empty comment, which should result in a failed comment creation
        #@attr = FactoryGirl.attributes_for(:comment, :citation_id => @citation.id)
        @attr = {:content => "Sample comment text"}
      end
      
      it "should create a new comment" do
        lambda do
          post :create, :content => @attr, :citation_id => @citation.id
        end.should change(Comment, :count).by(1)
      end
      
      #it "should redirect to the citation's 'show' page" do
      #  @comment = @citation.comments.build(@attr[:content]
      #  post :create, :comment => @comment, :citation_id => @citation.id
      #  response.should redirect_to(@citation)
      #end
    end
    
  end
  
  
  
end
