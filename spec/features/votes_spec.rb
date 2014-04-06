require 'spec_helper'

describe "Votes", :js => true do

  describe "logged in users " do
    let(:user) {FactoryGirl.create(:user)}
    let!(:question) {FactoryGirl.create(:question)}
    let!(:answer) {FactoryGirl.create(:answer)}
    before(:each) do
      answer.question = question
      answer.save
      visit root_path
      click_on 'Login'
      fill_in 'Email', :with => user.email
      fill_in 'Password', :with => user.password
      click_button 'Sign in'
      click_on "Questions"
      click_on question.title.first
    end

    it "can upvote a question" do
      within ('.page-header') {click_on 'up vote'}
      wait_for_ajax_to_finish
      expect(page).to have_content(1)
    end

    it "can downvote a question" do
      within ('.page-header') {click_on 'down vote'}
      wait_for_ajax_to_finish
      expect(page).to have_content(-1)
    end

    it "can upvote an answer" do
      within ('.answer') {click_on 'up vote'}
      wait_for_ajax_to_finish
      expect(page).to have_content(1)
    end

    it "can downvote an answer" do
      within ('.answer') {click_on 'down vote'}
      wait_for_ajax_to_finish
      expect(page).to have_content(-1)
    end
  end

end