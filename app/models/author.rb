class Author < ActiveRecord::Base
  has_many :citation_author_relationships, :foreign_key => "author_id"
  has_many :citations, :through => :citation_author_relationships
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

