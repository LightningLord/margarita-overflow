require 'spec_helper'
describe CommentsController do

  context 'new' do

    before(:each){get :new}

    it "is successful" do
      expect(response).to be_success
    end

    it "assigns @comment to a new comment" do
      expect(assigns(:comment)).to be_a_new Comment
    end

  end

  context 'create' do
    let(:question){FactoryGirl.create(:question)}
    let(:user){FactoryGirl.create(:user)}
    let(:answer){FactoryGirl.create(:answer)}
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
    it "creates a new question comment" do
      expect {
        post :create, :comment => {
          :commentable_id => question.id, content: "Winter is coming",
          :commentable_type => "Question"
        }
        expect(response).to render_template(:partial => '_show_comment')
      }.to change{Comment.count}.by(1)
    end

    it "creates a new answer comment" do
      expect {
        post :create, :comment => {
          :commentable_id => answer.id, content: "I pay the iron price",
          :commentable_type => "Answer"
        }
        expect(response).to redirect_to(question_path(answer.question))
      }.to change{Comment.count}.by(1)
    end

  end

end