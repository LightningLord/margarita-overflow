class Answer < ActiveRecord::Base
  attr_protected :id
  has_many :votes, as: :votable
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :question
  belongs_to :user
end