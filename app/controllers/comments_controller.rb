class CommentsController < ApplicationController

  def create
    @citation = Citation.find(params[:comment][:citation_id])
    @comment = @citation.comments.build(:content => params[:comment][:content])
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Your comment was added"
    else
      flash[:error] = "Comment not added: comments cannot be blank"
    end
    redirect_to(@citation)
  end
  
  def new
    
  end
  
  def destroy
    
  end
  
end
