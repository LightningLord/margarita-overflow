require 'spec_helper'

describe "Questions", :js => true do
  let!(:question) { create :question }
  describe "User can sign in" do
      it "by signing up"
      visit '/'
      click_link('Sign up')
      fill_in('Email', :with => 'test@test.com')
      fill_in('Username', :with => 'test')
      fill_in('Password', :with => 'testingtesting')
      fill_in('Password', :with => 'testingtesting')
      click_button 'Sign up'
      page.should have_content('Logged in as test@test.com')
    end
  end

  describe "User can log out" do
    it "should not have access to answers" do
      visit '/'
      click_link('Sign up')
      fill_in('Email', :with => 'test@test.com')
      fill_in('Username', :with => 'test')
      fill_in('Password', :with => 'testingtesting')
      fill_in('Password', :with => 'testingtesting')
      click_link('Logout')
      page.should have_content('Signed out successfully.')
    end
  end



end



