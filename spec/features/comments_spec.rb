require 'spec_helper'

describe "Comments", :js => true do
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

    it "can comment on an answer" do
      click_on "Comment on Answer"
      fill_in 'comment[content]', :with => "Winter is coming"
      click_on 'Submit'
      expect(page).to have_content "Winter is coming"
    end

    it "can comment on a question" do
      click_on "Comment on Question"
      wait_for_ajax_to_finish
      within first('.new_comment') do
        fill_in 'comment[content]', :with => "Hear me roar"
      end
      first('.new_comment').click_button('Submit')
      wait_for_ajax_to_finish
      expect(page).to have_content "Hear me roar"
    end
  end
end