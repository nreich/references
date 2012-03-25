class ReferenceAuthorRelationship < ActiveRecord::Base

belongs_to :author
belongs_to :reference

end
