require 'spec_helper'

describe AnswersController do
  context "edit" do
    let (:answer){FactoryGirl.create(:answer)}
    it "updates an answer page" do
      expect {
        put :update, :id => answer.id,
        content: "Winter is coming"
      }.to change{answer.reload.content}.to "Winter is coming"
    end
  end

end
