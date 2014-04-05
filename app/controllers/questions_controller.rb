class QuestionsController < ApplicationController
  def index
    @questions = Question.all

  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.new
  end

  def new
    if session["warden.user.user.key"]
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.find(session["warden.user.user.key"][0][0])
    @question = Question.new(params[:question])
    @user.questions << @question
    if @question.save
      redirect_to question_path(@question)
    else
      redirect_to new_question_path
    end
  end

end