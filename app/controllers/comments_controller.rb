class CommentsController < ApplicationController

  def create
    @citation = Citation.find(params[:citation_id])
    @comment = @citation.comments.build(params[:content])
    @comment.user = current_user
    if @comment.save
      
    else
      
    end
    redirect_to(@citation)
  end
  
  def destroy
    
  end
  
end
