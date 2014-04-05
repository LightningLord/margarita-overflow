class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    @vote = Vote.new(params[:vote_data])

    if @vote.save
      if @vote.votable_type == "Question"
        @question = Question.find(@vote.votable_id)
        @question.update_attributes(vote_count: @question.vote_count + @vote.value)
        current_user.votes << @vote
        respond_to do |format|
          format.json {render json: @question.to_json}
        end
      elsif @vote.votable_type == "Answer"
        @answer = Answer.find(@vote.votable_id)
        @answer.update_attributes(vote_count: @answer.vote_count + @vote.value)
        current_user.votes << @vote
        respond_to do |format|
          format.json {render json: @answer}
        end
      end

    else
      render text: @vote.errors.full_messages.join(', '), :status => :unprocessable_entity
    end

  end

  def destroy
  end

end