require 'spec_helper'

describe "Questions", :js => true do
  # let!(:question) { create :question }
  #There is no way to do capybara like a before but we can use before to use less of repetition I believe but in Rspec. Still think we would need to go thru all these actions which is fine.
  describe "User can sign in" do
      it "by signing up" do
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

    it "if this person already has an account" do
      visit '/'
      click_link('Sign up')
      fill_in('Email', :with => 'test@test.com')
      fill_in('Username', :with => 'test')
      fill_in('Password', :with => 'testingtesting')
      fill_in('Password', :with => 'testingtesting')
      click_button 'Sign up'
      click_button 'Login'
      fill_in('Email', :with => 'test@test.com')
      fill_in('Password', :with => 'testingtesting')
      page.should have_content('Logged in as test@test.com')
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

  describe "User can ask a question" do
    it "only if they are logged in" do
      visit '/'
      click_link('Sign up')
      fill_in('Email', :with => 'test@test.com')
      fill_in('Username', :with => 'test')
      fill_in('Password', :with => 'testingtesting')
      fill_in('Password', :with => 'testingtesting')
      click_button 'Sign up'
      click_button 'Login'
      fill_in('Email', :with => 'test@test.com')
      fill_in('Password', :with => 'testingtesting')
      click_link('Ask a question')
      fill_in('Title', :with => 'yolo')
      fill_in('Body', :with => 'Lorizzle ipsum dolizzle my shizz , my shizz bow wow wow elit. Nullizzle sapizzle velizzle, im in the shizzle break it down, suscipit quizzle, gravida vizzle, arcu. Pellentesque egizzle tortizzle. Sed eros.')
      click_button 'Create Question'
      #have to figure out a way to click on create question for further the test
    end
  end

    it "if they are not logged in it will just render back page" do
      click_link('Ask a question')
      fill_in('Title', :with => 'yolo')
      fill_in('Body', :with => 'Lorizzle ipsum dolizzle my shizz , my shizz bow wow wow elit. Nullizzle sapizzle velizzle, im in the shizzle break it down, suscipit quizzle, gravida vizzle, arcu. Pellentesque egizzle tortizzle. Sed eros.')
      click_link('Create Question')
      page.should have_content('Ask a question')
    end


end



