require 'spec_helper'

describe Reference do
   
  describe "relationship with authors" do
  
    before(:each) do
      #@user = Factory(:user)
      #test_sign_in(@user)
      @reference = Factory(:reference)
    end
    
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
#  title           :string(255)
#  abstract        :string(255)
#  pubmed_url      :string(255)
#  file_location   :string(255)
#  reference_type  :string(255)
#  year            :date
#  journal         :string(255)
#  issue           :string(255)
#  volume          :string(255)
#  pages           :string(255)
#  conference      :string(255)
#  patent_assignee :string(255)
#  patent_number   :string(255)
#  publisher       :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

