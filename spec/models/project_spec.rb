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
  end
  
end
