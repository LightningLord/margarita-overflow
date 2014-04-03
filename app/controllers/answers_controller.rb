class AnswersController < ApplicationController
  def create
    @answer = Answer.new
  end
end