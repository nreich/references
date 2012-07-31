class CitationsController < ApplicationController
  
  def index
    @citation = Citation.search(params[:search], params[:search_method])
  end

  def show
    @citation = Citation.find(params[:id])
  end
  
  def edit
    @citation = Citation.find(params[:id])
  end
  
  def update
    @citation = Citation.find(params[:id])
    if params[:project].nil? == false
      @project = Project.find(params[:project][:id])
      @citation.projects << @project
      redirect_to @citation
    else
      render 'edit'
    end
    
  end
  
end