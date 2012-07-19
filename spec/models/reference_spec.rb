require 'spec_helper'

describe Reference do
   
    before(:each) do
      @reference = FactoryGirl.create(:reference)
    end
   
  describe "relationship with authors" do
    
    it "should have a reference_author_relationship method" do
      @reference.should respond_to(:reference_author_relationships)
    end
    
    it "should have an authors method" do
      @reference.should respond_to(:authors)
    end
  
  end
  
  
end
# == Schema Information
#
# Table name: references
#
#  id              :integer(4)      not null, primary key
#  title           :text
#  abstract        :text
#  pubmed_url      :text
#  file_location   :text
#  reference_type  :string(255)
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

