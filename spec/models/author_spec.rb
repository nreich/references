require 'spec_helper'

describe Author do
   
  describe "relationship with references" do
  
    before(:each) do
      @author = FactoryGirl.create(:author)
    end
    
    it "should have a citation_author_relationships method" do
      @author.should respond_to(:citation_author_relationships)
    end
    
    it "should have a citations method" do
      @author.should respond_to(:citations)
    end
  
  end
  
end
# == Schema Information
#
# Table name: authors
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

