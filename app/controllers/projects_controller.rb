class ProjectsController < ApplicationController
  
  def new
    @project = Project.new
  end
    
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to '/projects'
    else
      render 'new'
    end
  end
  
  def index
    @project = Project.find(:all)
  end
  
  def show
    @project = Project.find(params[:id])
    @categories = @project.categories.uniq
    @citations = @project.citations
  end
  
end
