require 'spec_helper'

feature 'form interaction' do
  scenario 'user input displayes on homepage after submission with time stamp' do
    Timecop.freeze
    visit('/')
    fill_in 'message', with: 'Hey, this is a test message'
    click_button 'Submit'
    fill_in 'message', with: 'Hey, this is the second test message'
    click_button 'Submit'
    expect(page).to have_text('Hey, this is a test message')
    expect(page).to have_text('Hey, this is the second test message')
  end
end
