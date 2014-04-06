class Question < ActiveRecord::Base
  attr_protected :id
  belongs_to :user
  has_many :answers, :dependent => :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, :body, :user_id, :presence => true
  has_many :votes, as: :votable

  def update_vote_count(vote_value)
    self.update_attributes(vote_count: self.vote_count + vote_value)
  end

end