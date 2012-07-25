require 'spec_helper'

describe Comment do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    @citation = FactoryGirl.create(:citation)
    @attr = {:content => "Test comment"}
  end
  
  describe "failure" do
    
    it "should not create a new instance given invalid attributes" do
      lambda do
        @comment = @citation.comments.build(@attr)
        @comment.save()
      end.should_not change(Comment, :count)
    end
    
    it "should not create a new instance if content is blank" do
      lambda do
        @attr.merge(:content => "")
        @comment = @citation.comments.build(@attr)
        @comment.save()
      end.should_not change(Comment, :count)
    end
    
  end
  
  describe "success" do
    
    it "should create a new instance given valid attributes" do
      lambda do
        @comment = @citation.comments.build(@attr)
        @comment.user = @user
        @comment.save()  
      end.should change(Comment, :count).by(1)   
    end
    
  end
  
  describe "user assosciations" do
    
    before(:each) do
      @comment = @citation.comments.build(@attr)
      @comment.user = @user
      @comment.save() 
    end
    
    it "should have a user attribute" do
      @comment.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @comment.user_id.should be == @user.id
      @comment.user.should == @user 
    end
    
  end
  
  describe "citation assosciations" do
    
    before(:each) do
      @comment = @citation.comments.build(@attr)
      @comment.user = @user
      @comment.save()
    end
    
    it "should have a citation attribute" do
      @comment.should respond_to(:citation)
    end
    
    it "should have the right associated citation" do
      @comment.citation_id.should be == @citation.id
      @comment.citation.should == @citation 
    end
    
  end
  
  
end
# == Schema Information
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  citation_id :integer(4)
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

