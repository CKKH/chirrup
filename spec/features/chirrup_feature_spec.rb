require 'spec_helper'

feature 'Messages' do
  context 'Creating' do
    scenario 'A user can submit text and see it with a timestamp' do
      visit '/'
      fill_in :content, with: 'Hey, test one message'
      click_button 'Submit'
      expect(page).to have_content 'Hey, test one message'
    end

    scenario 'A user is redirected to homepage after submitting message' do
      visit '/'
      fill_in :content, with: 'Hey, test two message'
      click_button 'Submit'
      expect(page.current_path).to eq('/')
    end

    scenario 'A user can submit many messages and view them all' do
      Timecop.freeze
      visit('/')
      fill_in 'content', with: 'Hey, this is a test three message'
      click_button 'Submit'
      fill_in 'content', with: 'Hey, this is another test three message'
      click_button 'Submit'
      expect(page).to have_text('Hey, this is a test three message')
      expect(page).to have_text('Hey, this is another test three message')
    end
  end

end
