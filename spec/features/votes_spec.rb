require 'spec_helper'

describe "Votes", :js => true do

  describe "logged in users " do
    let(:user) {FactoryGirl.create(:user)}
    before(:each) do
      visit root_path
      click_on 'Login'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Sign in'
    end

    it "can vote" do

    end
  end

end