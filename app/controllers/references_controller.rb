class ReferencesController < ApplicationController
  
  def index
    @references = Reference.search(params[:search])
  end

  def show
    @reference = Reference.find(params[:id])
  end
  
end
