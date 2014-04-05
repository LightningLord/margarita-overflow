class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    params[:some_data] #assuming params contains all the information necessary (including votable id and type)
    @vote = Vote.new(params[:some_data])

    
    
    if @vote.save
      if @vote.votable_type == "question"
        @question = Question.find()
        respond_to do |format|
          format.json {render json: @}
        end
         
      #update the vote show erb
    else

    end

  end

  def destroy
  end

end