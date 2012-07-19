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

