feature 'creating links' do

  scenario 'I can add new tags on the new  page' do
    visit '/links/new'
    fill_in :url, with: 'www.google.com'
    fill_in :title, with: 'Google'
    fill_in :tags, with: 'search_engine Google'
    click_button 'submit'
    # within 'ul#links' do
    expect(page).to have_content('search_engine')
  end
  end
