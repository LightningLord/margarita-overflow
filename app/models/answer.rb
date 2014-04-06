class Answer < ActiveRecord::Base
  attr_protected :id
  has_many :votes, as: :votable
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :question
  belongs_to :user

  def update_vote_count(vote_value)
    self.update_attributes(vote_count: self.vote_count + vote_value)
  end
  
end