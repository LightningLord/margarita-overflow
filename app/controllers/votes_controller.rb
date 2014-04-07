class VotesController < ApplicationController

  def create
    vote = Vote.new(params[:vote_data])
    if current_user.has_not_voted?(vote.votable_type, vote.votable_id)
      if vote.save
        @votable = vote.votable_type.constantize.find vote.votable_id
        @votable.update_vote_count(vote.value)
        current_user.votes << vote
        render json: @votable.to_json
      end
    end
  end
end