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
      visit('/')
      fill_in :content, with: 'Hey, this is a test three message'
      click_button 'Submit'
      fill_in :content, with: 'Hey, this is another test three message'
      click_button 'Submit'
      expect(page).to have_text('Hey, this is a test three message')
      expect(page).to have_text('Hey, this is another test three message')
    end
  end

    context 'Viewing a message' do
      scenario 'message has embedded link that takes user to its own page' do
        message = Message.create(:content => 'Click on me to see my own page!')
        visit '/'
        click_on 'Click on me to see my own page!'
        expect(page.current_path).to eq("/messages/#{message.id}")
        expect(page).to have_content('Click on me to see my own page!')
      end
    end

    context 'Edit a message' do
      scenario 'user can visit edit page, and see message to be edited in text box' do
        message = Message.create(:content => 'Click on me to see my own page!')
        visit '/'
        click_on 'Click on me to see my own page!'
        click_button 'Edit'
        expect(page.current_path).to eq("/edit-message/#{message.id}")
        expect(page).to have_css('textarea[name="message"]')
        expect(page).to have_content(message.content)
      end

      scenario 'user can submit message edit, then be redirected to index' do
        message = Message.create(:content => 'Click on me to see my own page!')
        visit '/'
        click_on 'Click on me to see my own page!'
        click_button 'Edit'
        fill_in('message', with: 'Edited message')
        click_on 'Edit'
        expect(page.current_path).to eq("/")
        expect(page).to have_content 'Edited message'
      end
    end

end
