require 'spec_helper'

describe Reference do
   
  describe "journal article" do
  
    before(:each) do
      @reference = Factory(:reference)
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
#  type            :string(255)
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

