require 'spec_helper'

feature 'form interaction' do
  scenario 'user can interact with form with input and submit' do
    visit('/')
    fill_in 'message', with: 'Hey, this is a test message'
    click_button 'Submit'
    expect(page).to have_text 'Hey, this is a test message'
  end
end
