require 'spec_helper'

describe AnswersController do
  let (:answer){FactoryGirl.create(:answer)}
  let(:user){FactoryGirl.create(:user)}
  let(:question){FactoryGirl.create(:question)}
  context "update" do
    it "updates an answer page" do
      expect {
        put :update, :id => answer.id,
        content: "Winter is coming"
      }.to change{answer.reload.content}.to "Winter is coming"
    end
  end
  context "create" do

    it "creates a new user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
      expect {
        post :create, :answer => (FactoryGirl.attributes_for(:answer).merge(
        {:question_id => question.id}))
      }.to change {Answer.count}.by(1)

    end
  end

end
