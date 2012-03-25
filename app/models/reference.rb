class Reference < ActiveRecord::Base

has_many :reference_author_relationships, :foreign_key => "author_id"
has_many :authors, :through => :reference_author_relationships
  
  #Tests for this method should be added at some point...
  def author_list()
    i = 0
    list_of_authors = ""
    authors.each do |author|
      list_of_authors += author.name
      i += 1
      return list_of_authors if i == authors.count
      list_of_authors += "; "
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

