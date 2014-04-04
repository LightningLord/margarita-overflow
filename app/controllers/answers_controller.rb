class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    puts params
    @answer = Answer.create(params[:answer])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params)
  end
end