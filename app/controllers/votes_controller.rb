class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    vote = Vote.new(params[:vote_data])
    if current_user.voted?(vote.votable_type, vote.votable_id).empty?
      if vote.save && vote.votable_type == "Question"
        @question = Question.find(vote.votable_id)
        @question.update_vote_count(vote.value)
        current_user.votes << vote
        render json: @question.to_json
      elsif vote.save && vote.votable_type == "Answer"
        @answer = Answer.find(vote.votable_id)
        @answer.update_vote_count(vote.value)
        current_user.votes << vote
        format.json {render json: @answer.to_json}
      end
    else
      render text: "You've already voted."
    end

  end

  def destroy
  end

end