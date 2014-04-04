require 'spec_helper'

describe QuestionsController do
  context "#index" do

    it "renders the all questions page" do
      get :index
      expect(response).to render_template(:index)
    end

    it "returns all questions" do
      get :index
      Question.all.each do |question|
        expect(assigns(:questions)).to include(question)
      end
    end

  end

  context "#show" do

    it "shows a single question" do
      question = Question.create(title: "blah", body: "Test", user_id: 1)
      get :show, id: question
      expect(assigns(:question)).to eq(question)
    end

  end

end