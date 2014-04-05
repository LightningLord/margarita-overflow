class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  attr_protected :id
  belongs_to :user



end