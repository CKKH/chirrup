feature 'landing page' do
  scenario 'user visits landing page and can see header' do
    visit '/'
    expect(page).to have_text 'Chirrup!'
  end
end
