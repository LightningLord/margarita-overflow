class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :created_at, :updated_at
  belongs_to :user
  has_many :answers, :dependent => :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, :body, :user_id, :presence => true
  has_many :votes, as: :votable

end