require 'spec_helper'

describe CitationsController do

  render_views
  describe "GET 'show'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
    end
    
    it "should be successful" do
      get :show, :id => @citation
      response.should be_success
    end
    
    it "should find the right citation" do
      get :show, :id => @citation
      assigns(:citation).should == @citation
    end
    
    it "should have the right citation title" do
      get :show, :id => @citation
      response.should have_selector("p", :content => @citation.title)
    end
    
    it "should have the right citation abstract" do
      get :show, :id => @citation
      response.should have_selector("p", :content => @citation.abstract)
    end
    
  end
  
  describe "GET 'show' for journal articles" do
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
      @author = FactoryGirl.create(:author)
      #@citation_author_relationship = 
      #  @citation.citation_author_relationships.build(:author_id => @author.id,
      #                                            :citation_id => @citation.id)
      @relationship = FactoryGirl.create(:citation_author_relationship)
    end
    
    it "should have the right citation journal" do
      get :show, :id => @citation
      response.should have_selector("p", :content => @citation.journal)
    end
    
    it "should have an author list" do
      get :show, :id => @citation
      response.should have_selector("p", :content => @author.name)
      #Technically, this currently only looks for a single author and not
      #an entire list of authors
    end
    
  end
  
 describe "GET 'index'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
    end
    
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should return the right citation, given a title" do
      get :index, :search => @citation.title, :search_method => "title_or_abstract"
      response.should have_selector("td", :content => @citation.title)
    end
    
  end
  
end
