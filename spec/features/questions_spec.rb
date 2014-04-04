require 'spec_helper'

describe "Questions", :js => false do
  # let!(:question) { create :question }
  #There is no way to do capybara like a before but we can use before to use less of repetition I believe but in Rspec. Still think we would need to go thru all these actions which is fine.

  # sign up ##########
  # visit '/'
  # click_link('Sign up')
  # fill_in('Email', :with => 'test@test.com')
  # fill_in('Username', :with => 'test')
  # fill_in('Password', :with => 'testingtesting')
  # fill_in('Password', :with => 'testingtesting')
  # click_button 'Sign up'

## log in ##
     # click_on 'Login'
     #  fill_in('Email', :with => 'test@test.com')
     #  fill_in('Password', :with => 'testingtesting')
     #  click_button 'Sign in'


  describe "User can sign in" do
    it "by signing up" do
      visit root_path
      click_on 'Sign up'
      fill_in 'Email', :with => 'ned@stark.com'
      fill_in 'Username', :with => 'nedstark'
      fill_in 'Password', :with => 'winteriscoming'
      fill_in 'Password confirmation', :with => 'winteriscoming'
      click_button 'Sign up'
      expect(page).to have_content('Welcome, nedstark')
    end
  end

    let(:user) {FactoryGirl.create(:user)}
    it "if this person already has an account" do
      visit root_path
      click_on 'Login'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Sign in'
      expect(page).to have_content("Welcome, #{user.username}")
    end


  describe "User can log out" do
    it "should not have access to answers" do

    end
  end

  describe "User can ask a question" do
    it "only if they are logged in" do

      #have to figure out a way to click on create question for further the test
    end
  end

    it "if they are not logged in it will just render back page" do
    end


end



