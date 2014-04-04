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
    let(:user){FactoryGirl.create(:user)}
    let(:question){FactoryGirl.create(:question)}


    it "shows a single question" do
      get :show, :id => question.id
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
      request.session["warden.user.user.key"][0][0] = 2
      expect {
        post :create, :question => FactoryGirl.attributes_for(:question)
        expect(response).to be_success
      }.to change { Question.count }.by(1)
    end
  end
  it "with invalid attributes" do
      request.session["warden.user.user.key"][0][0] = 2

      expect {
        post :create
        expect(response.status).to eq 422
      }.to_not change { Question.count }
    end

end
