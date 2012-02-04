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

require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :first_name => "Example", :last_name => "User", :email => "user@ardelyx.com" }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a first name" do
    no_first_name_user = User.new(@attr.merge(:first_name => ""))
    no_first_name_user.should_not be_valid
  end
  
  it "should require a last name" do
    no_last_name_user = User.new(@attr.merge(:first_name => ""))
    no_last_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should require an ardelyx email address" do
    non_ardelyx_email_user = User.new(@attr.merge(:email => "user@bigpharma.com"))
    non_ardelyx_email_user.should_not be_valid
  end
end
