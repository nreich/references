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
      if @project = Project.find_by_id(params[:project][:id])
        @citation.projects << @project
        redirect_to @citation
      else
        flash[:failure] = "Failure to update projects: you must select a valid project to add."
        render 'edit'
      end
    elsif params[:category].nil? == false
      if @category = Category.find_by_id(params[:category][:id])
        @citation.categories << @category
        redirect_to @citation
      else
        flash[:failure] = "Failure to update categories: you must select a valid category to add."
        render 'edit'
      end
      
    else
      render 'edit'
    end
    
  end
  
end