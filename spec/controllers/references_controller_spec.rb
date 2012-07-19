require 'spec_helper'

describe ReferencesController do

  render_views
  describe "GET 'show'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @reference = FactoryGirl.create(:reference)
    end
    
    it "should be successful" do
      get :show, :id => @reference
      response.should be_success
    end
    
    it "should find the right reference" do
      get :show, :id => @reference
      assigns(:reference).should == @reference
    end
    
    it "should have the right reference title" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @reference.title)
    end
    
    it "should have the right reference abstract" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @reference.abstract)
    end
    
  end
  
  describe "GET 'show' for journal articles" do
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @reference = FactoryGirl.create(:reference)
      @author = FactoryGirl.create(:author)
      #@reference_author_relationship = 
      #  @reference.reference_author_relationships.build(:author_id => @author.id,
      #                                            :reference_id => @reference.id)
      @relationship = FactoryGirl.create(:reference_author_relationship)
    end
    
    it "should have the right reference journal" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @reference.journal)
    end
    
    it "should have an author list" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @author.name)
      #Technically, this currently only looks for a single author and not
      #an entire list of authors
    end
    
  end
  
 describe "GET 'index'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @reference = FactoryGirl.create(:reference)
    end
    
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should return the right reference, given a title" do
      get :index, :search => @reference.title, :search_method => "title_or_abstract"
      response.should have_selector("td", :content => @reference.title)
    end
    
  end
  
end
