feature 'filtering by a tag' do
  scenario 'filter by the bubbles tag' do
    visit '/links/new'
    fill_in :url, with: 'www.bubbles.com'
    fill_in :title, with: 'Bubbles'
    fill_in :tags, with: 'Bubbles'
    click_button 'submit'
    fill_in :search, with: 'Bubbles'
    click_button 'Submit'
    expect(page).to have_content 'www.bubbles.com'
  end
end
