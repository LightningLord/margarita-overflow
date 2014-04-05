class Question < ActiveRecord::Base
  attr_protected :id
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :title, :body, :user_id, :presence => true
  has_many :votes, as: :votable

end