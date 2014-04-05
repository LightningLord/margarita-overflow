class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    p "these are the params"
    p params
    p "these are the params vote data"
    p params[:vote_data] #assuming params contains all the information necessary (including votable id and type)
    @vote = Vote.new(params[:vote_data])

    if @vote.save
      if @vote.votable_type == "Question"
        @question = Question.find(@vote.votable_id)
        @question.update_attributes(vote_count: @question.vote_count + 1)
        current_user.votes << @vote
        respond_to do |format|
          format.json {render json: @question}
        end
      elsif @vote.votable_type == "Answer"
        @answer = Answer.find(@vote.votable_id)
        respond_to do |format|
          format.json {render json: @answer}
        end
      end
 
      #update the vote show erb
    else

    end

  end

  def destroy
  end

end