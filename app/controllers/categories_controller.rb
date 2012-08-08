class CategoriesController < ApplicationController
  
  def create
    @citation = Citation.find(params[:citation_id])
    @category = @citation.categories.build(params[:category])
    if @category.save
      
    else
      
    end
    redirect_to '/'
  end
  
  def index
    @category = Category.find(:all)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
end
