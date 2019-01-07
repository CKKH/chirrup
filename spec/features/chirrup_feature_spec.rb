require 'spec_helper'
require_relative 'web_helpers'

feature 'Messages' do
  context 'Creating' do
    scenario 'A user can submit text and see it with a timestamp' do
      visit_homepage_and_submit_message_with_tag
      expect(page).to have_content 't1 message'
    end

    scenario 'A user is redirected to homepage after submitting message' do
      visit_homepage_and_submit_message_with_tag
      expect(page.current_path).to eq('/')
    end

    scenario 'A user can submit many messages and view them all' do
      visit_homepage_and_submit_message_with_tag
      visit_homepage_and_submit_second_message
      expect(page).to have_text('t1 message')
      expect(page).to have_text('t2 message')
    end

    scenario "only first 20 characters of user input displayed on homepage" do
      visit('/')
      fill_in :content, with: 'abcdefghijklmnopqrstuvwxyz'
      click_button 'Submit'
      expect(page).to have_no_content('uvwxyz')
    end
  end

  context 'Viewing a message' do
    scenario 'message has embedded link that takes user to its own page' do
      message = Message.create(:content => 'Click me')
      visit_homepage_and_click_on_existing_message_link
      expect(page.current_path).to eq("/messages/#{message.id}")
      expect(page).to have_content('Click me')
    end
  end

  context 'Edit a message' do
    scenario 'user can visit edit page, and see message to be edited in text box' do
      message = Message.create(:content => 'Click me')
      visit_homepage_and_click_on_existing_message_link
      click_button 'Edit'
      expect(page.current_path).to eq("/edit-message/#{message.id}")
      expect(page).to have_css('textarea[name="message"]')
      expect(page).to have_content(message.content)
    end

    scenario 'user can submit message edit, then be redirected to index' do
      message = Message.create(:content => 'Click me')
      visit_homepage_and_click_on_existing_message_link
      click_button 'Edit'
      fill_in('message', with: 'Edited message')
      click_button 'Edit'
      expect(page.current_path).to eq("/")
      expect(page).to have_content 'Edited message'
    end
  end

  context 'Delete a message' do
    scenario 'user can delete a message, then be redirected to index' do
      message = Message.create(:content => 'Click me')
      visit_homepage_and_click_on_existing_message_link
      click_button 'Delete'
      expect(page.current_path).to eq('/')
      expect(page).to_not have_content 'Click me'
    end
  end

end
