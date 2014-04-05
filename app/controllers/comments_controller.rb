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
      render :partial => "show_comment", locals: {:comment => @comment}
    end

  end
end