require 'spec_helper'

describe 'projects'  do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
    visit sign_in_path
    fill_in :email,    :with => @user.email
    fill_in :password, :with => @user.password
    click_button
  end
  
  describe 'add new project' do
    
    it "should not created a new project if name is blank" do
      lambda do
        visit '/projects/new'
        fill_in "Name", :with => ""
        click_button
        response.should render_template('projects/new')
        response.should have_selector("div#error_explanations")
      end.should_not change(Project, :count)
      
    end
    
    it 'should redirect to projects if created from projects page' do
      lambda do
        visit '/projects/new'
        fill_in "Name", :with => "new test project"
        click_button
        response.should render_template('projects')
      end.should change(Project, :count).by(1)
      
    end
    
  end
  
end
