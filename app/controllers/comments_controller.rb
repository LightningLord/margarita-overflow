class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render :partial => "new_comment"
  end

  def create
    @comment = Comment.new(params[:comment])
    user = User.find(current_user.id)
    @comment.user_id = user.id
    if @comment.save
      if @comment.commentable_type == "Answer"
        redirect_to question_path(Answer.find(@comment.commentable_id).question)
      else
        render :partial => "show_comment", locals: {:comment => comment}
      end
    end
  end
end