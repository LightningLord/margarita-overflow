class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  attr_protected :id

  def assignVote
    
  end  

end