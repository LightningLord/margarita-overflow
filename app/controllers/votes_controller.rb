class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    vote = Vote.new(params[:vote_data])
    if current_user.voted?(vote.votable_type, vote.votable_id).empty?
      if vote.save
        @votable = vote.votable_type.constantize.find vote.votable_id
        @votable.update_vote_count(vote.value)
        current_user.votes << vote
        render json: @votable.to_json
      end
    end

  end

  def destroy
  end

end