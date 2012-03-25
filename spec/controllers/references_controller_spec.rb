require 'spec_helper'

describe ReferencesController do

  render_views
  describe "GET 'show'" do
  
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @reference = Factory(:reference)
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
      @user = Factory(:user)
      test_sign_in(@user)
      @reference = Factory(:reference)
      @author = Factory(:author)
      #@reference_author_relationship = 
      #  @reference.reference_author_relationships.build(:author_id => @author.id,
      #                                            :reference_id => @reference.id)
      @relationship = Factory(:reference_author_relationship)
    end
    
    it "should have the right reference journal" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @reference.journal)
    end
    
    it "should have an author list" do
      get :show, :id => @reference
      response.should have_selector("p", :content => @author.name)
      #Technically, this currenty only looks for a single author and not
      #an entire list of authors
    end
    
  end

end
