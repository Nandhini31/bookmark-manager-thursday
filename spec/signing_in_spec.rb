feature 'sign in ' do
  scenario 'signing up correctly' do
    visit '/'
    fill_in :email, with: 'fakeemail@email.com'
    fill_in :password, with:              'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button 'login'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome fakeemail@email.com'
  end

  scenario 'signing up incorrectly' do
    visit '/'
    fill_in :email, with: 'fakeemail@email.com'
    fill_in :password, with:              'password123'
    fill_in :password_confirmation, with: 'password1234'
    click_button 'login'
    expect(current_path).to eq '/'
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
