require 'spec_helper'

describe UsersController do
  let(:user){FactoryGirl.create(:user)}
  context "show" do
    before(:each) {get :show, :id => user.id}
    it "is successful" do
      expect(response).to render_template(:show)
    end

    it "assigns @user to the correct user" do
      expect(assigns(:user)).to eq user
    end
  end
end