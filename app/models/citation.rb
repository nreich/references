class Citation < ActiveRecord::Base

has_many :citation_author_relationships, :foreign_key => "citation_id"  #"author_id"
has_many :authors, :through => :citation_author_relationships
has_many :comments
has_and_belongs_to_many :projects
has_and_belongs_to_many :categories
   
  def self.search(search, method)
    if search
      if method == "title_or_abstract"
      #This statement needs work, does not retrieve authors
        find :all, :conditions => ['citations.title LIKE :search
                              OR citations.abstract LIKE :search', {:search => "%#{search}%"} ]
      elsif method == "author"
        find :all, :joins => :authors,
                   :conditions => ['authors.name LIKE :search', {:search => "%#{search}%"} ]
      end
    else
      scoped
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

