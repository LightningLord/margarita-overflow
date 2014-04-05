class Answer < ActiveRecord::Base
  attr_protected :id
  has_many :votes, as: :votable
  belongs_to :question
  belongs_to :user
end