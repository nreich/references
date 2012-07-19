class ReferencesController < ApplicationController
  
  def index
    @references = Reference.search(params[:search], params[:search_method])
  end

  def show
    @reference = Reference.find(params[:id])
  end
  
end
