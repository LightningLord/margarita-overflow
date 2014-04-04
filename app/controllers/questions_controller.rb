class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end
end