require 'spec_helper'

describe QuestionsController do
  let(:user){FactoryGirl.create(:user)}
  let(:question){FactoryGirl.create(:question)}
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

    it "shows a single question" do
      get :show, :id => question.id
      expect(assigns(:question)).to eq(question)
    end

    it "renders the answer box" do
    end
  end

  context "#new" do
    it "is successful" do
      request.session["warden.user.user.key"] = [[user.id]]
      get :new
      expect(response).to be_success
    end

  end

  context "#create" do
    it "with valid attributes" do
      request.session["warden.user.user.key"] = [[user.id]]
      expect {
        post :create, :question => FactoryGirl.attributes_for(:question)
        expect(response).to be_redirect
      }.to change { Question.count }.by(1)
    end
    it "with invalid attributes" do
      request.session["warden.user.user.key"] = [[user.id]]
      expect {
        post :create
        expect(response).to redirect_to new_question_path
      }.to_not change { Question.count }
    end
  end

end