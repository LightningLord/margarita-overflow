class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers
  end

  def new
    @question = Question.new if session
  end

  def create
    @user = User.find(session["warden.user.user.key"][0][0])
    @question = Question.new(params[:question])
    @user.questions << @question
    if @question.save
      redirect_to question_path(@question)
    end
  end

end