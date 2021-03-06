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
        @attr = {:content => "", :citation_id => @citation.id}
      end
      
      it "should not create a comment" do
        lambda do
          post :create, :comment => @attr
        end.should_not change(Comment, :count)
      end
      
      it "should redirect back to the citation" do
        post :create, :comment => @attr
        response.should redirect_to(@citation)
      end
      
      it "should flash a failure message" do
        post :create, :comment => @attr
        flash[:error].should =~ /comment not added: comments cannot be blank/i
      end
      
      
    end
    
    describe "success" do
      
      before(:each) do
        @citation = FactoryGirl.create(:citation)
        #passed is an empty comment, which should result in a failed comment creation
        #@attr = FactoryGirl.attributes_for(:comment, :citation_id => @citation.id)
        @attr = {:content => "Sample comment text", :citation_id => @citation.id}
      end
      
      it "should create a new comment" do
        lambda do
          post :create, :comment => @attr
        end.should change(Comment, :count).by(1)
      end
      
      it "should redirect back to the citation" do
        post :create, :comment => @attr
        response.should redirect_to(@citation)
      end
      
      it "should flash a success message" do
        post :create, :comment => @attr
        flash[:success].should =~ /your comment was added/i
      end
      
      #it "should redirect to the citation's 'show' page" do
      #  @comment = @citation.comments.build(@attr[:content]
      #  post :create, :comment => @comment, :citation_id => @citation.id
      #  response.should redirect_to(@citation)
      #end
    end
    
  end
  
  
  
end
