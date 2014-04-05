class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true

  def assignVote
    
  end  

end