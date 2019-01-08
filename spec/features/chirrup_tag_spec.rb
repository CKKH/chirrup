require 'spec_helper'
require_relative 'web_helpers'

feature 'Tags' do
  context 'Creating' do
    scenario 'A user can submit text and see it with a timestamp' do
      visit '/'
      expect(page).to have_field('tag')
    end

    scenario 'A user can submit text and see it with a timestamp' do
      visit '/'
      expect(page).to have_field('tag')
      fill_in :tag, with: ('tag test')
      click_button 'Submit'
      expect(page).to have_text('tag test')
    end
  end

end

