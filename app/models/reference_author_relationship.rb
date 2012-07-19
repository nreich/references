class ReferenceAuthorRelationship < ActiveRecord::Base

belongs_to :author
belongs_to :reference

end
# == Schema Information
#
# Table name: reference_author_relationships
#
#  id           :integer(4)      not null, primary key
#  reference_id :integer(4)
#  author_id    :integer(4)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

