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

require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :first_name => "Example",
              :last_name => "User",
              :email => "user@ardelyx.com",
              :password => "foobar",
              :password_confirmation => "foobar"
            }
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
  
  it "should reject a duplicate first/last name combo" do
    User.create!(@attr)
    user_with_duplicate_name = User.new(@attr.merge(:email => "user2@ardelyx.com"))
    user_with_duplicate_name.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should require an ardelyx email address" do
    non_ardelyx_email_user = User.new(@attr.merge(:email => "user@bigpharma.com"))
    non_ardelyx_email_user.should_not be_valid
  end
  
  it "should reject a duplicate email address" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password validations" do
  
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a"*4
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      long = "a"*41
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end
    
    describe "has_password method" do
      
      it "should be true if the passwords matched" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should be false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end
      
      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@ardelyx.com", @attr[:password])
        nonexistent_user.should be_nil
      end
      
      it "should retrun the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
    end
  end
  
end
