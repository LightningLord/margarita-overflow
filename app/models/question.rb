class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :title, :body, :user_id, :presence => true
end