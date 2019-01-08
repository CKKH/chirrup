require 'spec_helper'
require_relative 'web_helpers'

feature 'Tags' do
  context 'Creating' do
    scenario 'A user can submit tag' do
      visit '/'
      expect(page).to have_field('tag')
    end

    scenario 'A user can submit tag' do
      visit '/'
      fill_in :tag, with: ('tag test')
      click_button 'Submit'
      expect(page).to have_text('tag test')
    end
  end

    scenario 'A user can submit many tags and view them all' do
      visit '/'
      fill_in :tag, with: ('tag test')
      click_button 'Submit'
      visit '/'
      fill_in :tag, with: ('tag test 2')
      click_button 'Submit'
      expect(page).to have_text('tag test')
      expect(page).to have_text('tag test 2')
    end

end

