class CommentsController < ApplicationController

  def create
    @citation = Citation.find(params[:comment][:citation_id])
    @comment = @citation.comments.build(:content => params[:comment][:content])
    @comment.user = current_user
    if @comment.save
      
    else
      
    end
    redirect_to(@citation)
  end
  
  def new
    
  end
  
  def destroy
    
  end
  
end
