require 'spec_helper'

describe Category do
  
  before(:each) do
    @citation = FactoryGirl.create(:citation)
    @attr = { :name => "test project"}
  end
  
  describe "failure" do
    
    it "should not create a new instance given invalid attributes" do
      lambda do
        @category = @citation.categories.build(@attr.merge(:name => ""))
        @category.save()        
      end.should_not change(Category, :count)      
    end
    
    it "should reject names longer than 20 characters" do
      lambda do
        long_name = 'a'*21
        long_name_category = @citation.categories.build(@attr.merge(:name => ""))
        long_name_category.save()
      end.should_not change(Category, :count)
    end
    
    it "should reject duplicate name/project_id pairs" do
      @category = @citation.categories.build(@attr)
      @category.save()
      duplicate_category = @citation.categories.build(@attr)
      duplicate_category.should_not be_valid
    end
    
  end
  
  describe "success" do
    
    it "should create a new instance given valid attributes" do
      lambda do
        @category = @citation.categories.build(@attr)
        @category.save()        
      end.should change(Category, :count).by(1)
    end
    

  end
  
  describe "association" do
    
    before(:each) do
      @category = @citation.categories.build(@attr)
      @category.save
    end
    
        
    describe "with citations" do
      
      it "should have a citation attribute" do
        @category.should respond_to(:citations)
      end
      
      it "should have the right associated citation" do
        @category.citations << @citation
        @category.citations.exists?(@citation.id).should be_true    
      end
      
    end
    
  end
  
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  project_id :integer(4)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

