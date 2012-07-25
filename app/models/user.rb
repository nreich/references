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
require 'digest'
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  has_many :comments
  
  email_regex = /\A[\w\-.]+@ardelyx.com/i
  
  validates :first_name, :presence => true,
                         :length => { :maximum => 25 }
  validates :last_name, :presence => true,
                        :length => { :maximum => 25 }
  # No duplications of a name (what to do if we ever have two people with same name?)
  validates_uniqueness_of :last_name, :scope => :first_name
  # Only allow ardelyx email addresses
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  # Create virtual attribute 'password_confirmation'
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 5..40 }
                       
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
    private
    
      def encrypt_password
        self.salt = make_salt if new_record?
        self.encrypted_password = encrypt(password)
      end
      
      def encrypt(string)
        secure_hash("#{salt}--#{string}")
      end
      
      def make_salt
        secure_hash("#{Time.now.utc}--#{password}")
      end
      
      def secure_hash(string)
        Digest::SHA2.hexdigest(string)
      end

end
# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#

