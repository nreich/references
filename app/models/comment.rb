class Comment < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  belongs_to :citation
  
  validates :user_id, :presence => true
  validates :content, :presence => true
  
  default_scope :order => 'comments.created_at ASC'
  
end
# == Schema Information
#
# Table name: comments
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  citation_id :integer(4)
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

