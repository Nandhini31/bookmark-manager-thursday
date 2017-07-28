feature 'sign in ' do
  scenario 'signing up' do

    visit '/'
    fill_in 'email', with: 'fakeemail@email.com'
    fill_in 'password', with: 'password123'
    click_button 'login'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome fakeemail@email.com'
  end
end
