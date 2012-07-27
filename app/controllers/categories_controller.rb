class CategoriesController < ApplicationController
  
  def create
    @project = Project.find(params[:project_id])
    @category = @project.categories.build(params[:category])
    if @category.save
      
    else
      
    end
    redirect_to '/'
  end
  
  def index
    
  end
  
end
