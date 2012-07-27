class Category < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :project
  has_and_belongs_to_many :citations
  
  validates :name, :presence => true, :length => { :maximum => 20 }
  validates_uniqueness_of :name, :scope => :project_id
end
# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  project_id :integer(4)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

