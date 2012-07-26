class ProjectsController < ApplicationController
    
  def create
    @project = Project.new(params[:project])
    @project.save
    redirect_to '/'
  end
  
  def index
    #@project = Project.find(:all)
  end
  
end
