class ReferencesController < ApplicationController
  def show
    @reference = Reference.find(params[:id])
  end
  
end
