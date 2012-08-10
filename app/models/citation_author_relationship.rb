class CitationAuthorRelationship < ActiveRecord::Base

belongs_to :author
belongs_to :citation

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

