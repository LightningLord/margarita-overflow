class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id
    @answer.save
    redirect_to question_path(@answer.question)
  end

  def edit #not currently used
    @answer = Answer.find(params[:id])
  end

  def update #not currently used
    @answer = Answer.find(params[:id])
    @answer.update_attributes(:content => params[:content])
    redirect_to question_path(@answer.question)
  end

  def show
    @answer = Answer.find(params[:id])
  end
end