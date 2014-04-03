class AnswersController < ApplicationController
  def create
    @answer = Answer.create(params)
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params)
  end
end