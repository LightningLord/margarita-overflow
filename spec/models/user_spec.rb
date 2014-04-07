require 'spec_helper'

describe User do
  it {should have_many :questions}
  it {should have_many :answers}
  it {should validate_presence_of :username}
  it {should validate_uniqueness_of :username}
  it {should have_many :votes}
  it {should have_many :comments}
  let(:user){FactoryGirl.create(:user)}
  let(:vote){Vote.create(votable_type: "Question", votable_id: user.id)}
  context "voted?" do
    it "returns an empty array if user has not voted on something" do
      expect(user.has_not_voted?(vote.votable_type, vote.votable_id)).to be_true
    end

    it "returns a not empty array if user has already voted on something" do
      user.votes << vote
      expect(user.has_not_voted?(vote.votable_type, vote.votable_id)).to be_false
    end
  end

end