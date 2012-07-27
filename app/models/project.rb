class Project < ActiveRecord::Base
  has_and_belongs_to_many :citations
  has_many :categories
  validates :name, :presence => true,
                   :length => { :maximum => 20 },
                   :uniqueness => { :case_sensitive => false }
end
# == Schema Information
#
# Table name: projects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

