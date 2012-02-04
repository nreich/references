# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  
  email_regex = /\A[\w\-.]+@ardelyx.com/i
  
  validates :first_name, :presence => true,
                    :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 25 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
