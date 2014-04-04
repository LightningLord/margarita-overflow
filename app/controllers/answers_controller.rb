class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    puts params

    @answer = Answer.new(params[:answer])
    # question = Question.find_by(@answer)
    if @answer.save
      redirect_to question_path(@answer.question)
    else
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params)
  end
end