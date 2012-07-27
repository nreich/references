require 'spec_helper'

describe Citation do
   
    before(:each) do
      @citation = FactoryGirl.create(:citation)
    end
   
  describe "relationship with authors" do
    
    it "should have a citation_author_relationship method" do
      @citation.should respond_to(:citation_author_relationships)
    end
    
    it "should have an authors method" do
      @citation.should respond_to(:authors)
    end
  
  end
  
  describe "comment associations" do
    
    before(:each) do
      @comment1 = FactoryGirl.create(:comment, :citation => @citation, :created_at => 1.hour.ago)
      @comment2 = FactoryGirl.create(:comment, :citation => @citation, :created_at => 1.day.ago)
    end
    
    it "should have a comments attribute" do
      @citation.should respond_to(:comments)
    end
    
    it "should have the right comments order" do
      @citation.comments.should == [@comment2, @comment1]
    end
    
  end
  
  describe "project associations" do
    
    it "should have a project attribute" do
      @citation.should respond_to(:projects)
    end
    
    it "should have the right associated projects" do
      @project = FactoryGirl.create(:project)
      @citation.projects << @project
      @citation.projects.exists?(@project.id).should be_true
    end
    
  end
  
  describe "category associations" do
    
    it "should have a category attribute" do
      @citation.should respond_to(:categories)
    end
    
    it "should have the right associated category" do
      @category = FactoryGirl.create(:category)
      @citation.categories << @category
      @citation.categories.exists?(@category.id).should be_true
    end
    
  end
  
  
end
# == Schema Information
#
# Table name: citations
#
#  id              :integer(4)      not null, primary key
#  title           :text
#  abstract        :text
#  pubmed_url      :text
#  file_location   :text
#  citation_type  :string(255)
#  journal         :string(255)
#  issue           :string(255)
#  volume          :string(255)
#  pages           :string(255)
#  conference      :text
#  patent_assignee :string(255)
#  patent_number   :string(255)
#  publisher       :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  publish_year    :string(255)
#  author_list     :text
#

