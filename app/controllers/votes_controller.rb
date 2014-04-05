class VotesController < ApplicationController

  def new
  end

  def show
  end

  def create
    params[:some_data] #assuming params contains all the information necessary
    @vote = Vote.new(params[:some_data])

    if @vote.save
      
    else

    end

  end

  def destroy
  end

end