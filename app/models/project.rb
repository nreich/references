class Project < ActiveRecord::Base
  has_and_belongs_to_many :citations
  validates :name, :presence => true,
                   :length => { :maximum => 20 },
                   :uniqueness => { :case_sensitive => false }
end
