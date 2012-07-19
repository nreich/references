require 'spec_helper'

describe ReferenceAuthorRelationship do
  
  before(:each) do
    @reference = FactoryGirl.create(:reference)
    @author = FactoryGirl.create(:author)
      
    @reference_author_relationship = 
    @reference.reference_author_relationships.build(:author_id => @author.id,
                                                    :reference_id => @reference.id)
  end
  
  describe "reference methods" do
  
    it "should have an author attribute" do
      @reference_author_relationship.should respond_to(:author)
    end
    
    it "should have the right author" do
      @reference_author_relationship.author.should == @author
    end
    
    it "should have an reference attribute" do
      @reference_author_relationship.should respond_to(:reference)
    end
    
    it "should have the right reference" do
      @reference_author_relationship.reference.should == @reference
    end
  
  end
  
end
# == Schema Information
#
# Table name: reference_author_relationships
#
#  id           :integer(4)      not null, primary key
#  reference_id :integer(4)
#  author_id    :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

