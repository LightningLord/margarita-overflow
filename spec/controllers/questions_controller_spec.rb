require 'spec_helper'

describe QuestionsController do
  context '#index' do

    it "renders all the questions page" do
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

    before(:each) do
      question = Question.new(title: "blah", body: "Test", user_id: 1)
    end

    it "shows a single question" do
      get :show, id: @question
      expect(assigns(:question)).to eq(question)
    end

    it "renders the answer box" do
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end

  end

  context "#create" do
    it "has valid attributes" do
      expect {
        post :create, :question => attributes_for(:question)
        expect(response).to be_success
      }.to change { Question.count }.by(1)
  end

  it "with invalid attributes" do
      expect {
        post :create
        expect(response.status).to eq 422
      }.to_not change { Todo.count }
    end

end
