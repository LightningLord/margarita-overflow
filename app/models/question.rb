class Question < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :created_at, :updated_at
  belongs_to :user
  has_many :answers, :dependent => :destroy
  validates :title, :presence => true
  validates :body, :presence => true
  validates :user_id, :presence => true
end