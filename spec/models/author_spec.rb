require 'spec_helper'

describe Author do
   
  describe "relationship with references" do
  
    before(:each) do
      @author = FactoryGirl.create(:author)
    end
    
    it "should have a reference_author_relationships method" do
      @author.should respond_to(:reference_author_relationships)
    end
    
    it "should have a references method" do
      @author.should respond_to(:references)
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

