class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id, :created_at, :updated_at
  has_many :votes, as: :votable
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :question
  belongs_to :user
end