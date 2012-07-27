require 'spec_helper'

describe Project do
 
  before(:each) do
    @attr = { :name => "test project"}
  end
 
  it "should create a new instance given valid attributes" do
    Project.create!(@attr)
  end
  
  it "should require a name" do
    no_name_project = Project.new(@attr.merge(:name => ""))
    no_name_project.should_not be_valid
  end
  
  it "should reject name over 20 charactesr" do
    long = "a"*21
    long_name_project = Project.new(@attr.merge(:name => long))
    long_name_project.should_not be_valid
  end
 
  it "should reject identical project names" do
    Project.create(@attr)
    duplicate_name_project = Project.new(@attr)
    duplicate_name_project.should_not be_valid
  end
 
  describe "association" do
    
    before(:each) do
      @project = Project.create(@attr)
    end
    
    describe "with citations" do
    
      it "should have a citation attribute" do
        @project.should respond_to(:citations)
      end
    
      it "should have the right associated citation" do
        @citation = FactoryGirl.create(:citation)
        @project.citations << @citation
        @project.citations.exists?(@citation.id).should be_true    
      end
    end
    
    describe "with categories" do
      
      it "should have a category attribute" do
        @project.should respond_to(:categories)
      end
      
      it "should have the right associated category" do
        @category = FactoryGirl.create(:category, :project => @project)
        @project.categories << @category
        @project.categories.exists?(@category.id).should be_true
      end
      
      it "should not allow more than one category of the same name" do
        @category1 = FactoryGirl.create(:category, :project => @project)
        @category2 = FactoryGirl.build(:category, :project => @project)
        @category2.should_not be_valid
      end
      
    end
     
  end
  
end
# == Schema Information
#
# Table name: projects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

