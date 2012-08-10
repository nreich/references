require 'spec_helper'

describe CitationAuthorRelationship do
  
  before(:each) do
    @citation = FactoryGirl.create(:citation)
    @author = FactoryGirl.create(:author)
      
    @citation_author_relationship = 
    @citation.citation_author_relationships.build(:author_id => @author.id,
                                                    :citation_id => @citation.id)
  end
  
  describe "citation methods" do
  
    it "should have an author attribute" do
      @citation_author_relationship.should respond_to(:author)
    end
    
    it "should have the right author" do
      @citation_author_relationship.author.should == @author
    end
    
    it "should have an citation attribute" do
      @citation_author_relationship.should respond_to(:citation)
    end
    
    it "should have the right citation" do
      @citation_author_relationship.citation.should == @citation
    end
  
  end
  
end
# == Schema Information
#
# Table name: citation_author_relationships
#
#  id           :integer(4)      not null, primary key
#  citation_id  :integer(4)
#  author_id    :integer(4)
#  author_order :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

