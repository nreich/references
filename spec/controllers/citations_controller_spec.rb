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
      response.should have_selector("div", :content => @citation.title)
    end
    
    it "should have the right citation abstract" do
      get :show, :id => @citation
      response.should have_selector("div", :content => @citation.abstract)
    end
    
  end
  
  describe "GET 'show' for journal articles" do
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
      @author = FactoryGirl.create(:author)
      @relationship = FactoryGirl.create(:citation_author_relationship)
    end
    
    #it "should have the right citation journal" do
    #  get :show, :id => @citation
    #  response.should have_selector("div", :content => @citation.journal)
    #and
    
    it "should have an author list" do
      get :show, :id => @citation
      response.should have_selector("div", :content => @author.name)
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
  
  describe "GET 'edit'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
    end
    
    it "shoud be successful" do
      get :edit, :id => @citation
      response.should be_success
    end
  
  end
  
  describe "POST 'update'" do
  
    before(:each) do
      @user = FactoryGirl.create(:user)
      test_sign_in(@user)
      @citation = FactoryGirl.create(:citation)
    end
    
    describe "project" do
      
      describe "failure" do
        
        before(:each) do
          @project = FactoryGirl.create(:project)
          
        end
        
        #Since the citation itself is not being changes, just the projects/categories
        #this set of tests is making sure that if the blank entry is selected from dropdown list
        #that everything is handled properly
        
        it "should render the 'edit' page" do
          put :update, :id => @citation, :project => {:id => nil, :name => ""}
          response.should render_template('edit')
        end
        
        it "should flash a failure method" do
          put :update, :id => @citation, :project => {:id => nil, :name => ""}
          flash[:failure].should =~ /failure to update projects:/i
        end
        
        it "should not change the number of projects the citation belongs to" do
          lambda do
            put :update, :id => @citation, :project => {:id => nil, :name => ""}
          end.should_not change(@citation.projects, :count)
        end
        
      end
      
      describe "success" do
        
        before(:each) do
          @project = FactoryGirl.create(:project)
        end
        
        it "should create a new citation_project relationship" do
          lambda do
            put :update, :id => @citation, :project => {:id => @project.id, :name => @project.name}  
          end.should change(@citation.projects, :count).by(1)
        end
        
        it "should create a relatioship to the right project" do
          put :update, :id => @citation, :project => {:id => @project.id, :name => @project.name}
          @citation.projects.include?(@project).should be_true
        end
        
        it "should redirect to the citation show page" do
          put :update, :id => @citation, :project => {:id => @project.id, :name => @project.name}
          response.should redirect_to(citation_path(@citation))
        end
        
      end
      
    end
    
    describe "citation" do
      
      describe "failure" do
        
        before(:each) do
          @category = FactoryGirl.create(:category)
          
        end
        
        #Since the citation itself is not being changes, just the projects/categories
        #this set of tests is making sure that if the blank entry is selected from dropdown list
        #that everything is handled properly
        
        it "should render the 'edit' page" do
          put :update, :id => @citation, :category => {:id => nil, :name => ""}
          response.should render_template('edit')
        end
        
        it "should flash a failure method" do
          put :update, :id => @citation, :category => {:id => nil, :name => ""}
          flash[:failure].should =~ /failure to update categories:/i
        end
        
        it "should not change the number of categories the citation belongs to" do
          lambda do
            put :update, :id => @citation, :category => {:id => nil, :name => ""}
          end.should_not change(@citation.categories, :count)
        end
        
      end
      
      describe "success" do
        
        before(:each) do
          @category = FactoryGirl.create(:category)
        end
        
        it "should create a new category_citation relationship" do
          lambda do
            put :update, :id => @citation, :category => {:id => @category.id, :name => @category.name}  
          end.should change(@citation.categories, :count).by(1)
        end
        
        it "should create a relatioship to the right project" do
          put :update, :id => @citation, :category => {:id => @category.id, :name => @category.name}
          @citation.categories.include?(@category).should be_true
        end
        
        it "should redirect to the citation show page" do
          put :update, :id => @citation, :category => {:id => @category.id, :name => @category.name}
          response.should redirect_to(citation_path(@citation))
        end
        
      end
      
    end
    
    
  end
  
end
