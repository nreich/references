class CitationsController < ApplicationController
  
  def index
    @citation = Citation.search(params[:search], params[:search_method])
  end

  def show
    @citation = Citation.find(params[:id])
  end
  
end