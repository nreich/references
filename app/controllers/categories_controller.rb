class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category])
    @category.save
    redirect_to '/'
    # @citation = Citation.find(params[:citation_id])
    # @category = @citation.categories.build(params[:category])
    # if @category.save
#       
    # else
#       
    # end
    # redirect_to '/'
  end
  
  def index
    @category = Category.find(:all)
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
end
