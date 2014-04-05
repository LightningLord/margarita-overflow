require 'spec_helper'

describe "Users", :js => true do
  # let!(:question) { create :question }
  #There is no way to do capybara like a before but we can use before to use less of repetition I believe but in Rspec. Still think we would need to go thru all these actions which is fine.
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
end

describe "Users" do

  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
  end

  describe " who are logged in" do
    it "if this person already has an account" do
      expect(page).to have_content("Welcome, #{user.username}")
    end
  end

  describe "User can log out" do
    it "should not have access to answers" do
      click_on 'Logout'
      expect(page).to have_content('Login')
    end
  end

  describe "User can ask a question" do
    it "when logged in" do
      first('.jumbotron').click_on("Ask a question")
      fill_in 'Title', :with => "Die?"
      fill_in 'Body', :with => "Will Ned Stark Die?"
      click_on 'Create Question'
      expect(page).to have_content('Die?')
    end
  end

  describe "User cannot ask a question" do
    it "when logged out" do
      click_on 'Logout'
      first('.jumbotron').click_on("Ask a question")
      expect(page).to_not have_content('Title')
    end
  end
end



describe "User can answer a question" do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    visit root_path
    click_on 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
    first('.jumbotron').click_on("Ask a question")
    fill_in 'Title', :with => "Die?"
    fill_in 'Body', :with => "Will Ned Stark Die?"
    click_on 'Create Question'
    expect(page).to have_content('Die?')
  end

  it "when logged in" do
    fill_in "answer[content]", :with => "A Lannister Always Pays His Debt"
    click_on "Submit!"
    expect(page).to have_content("A Lannister Always Pays His Debt")
  end

end



