require 'rails_helper'

feature 'User authentication' do
  background do
    create(:user)
    visit '/'
    find('.sign-in').click
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    find('.user-icon').click
    find('.edit-profile').click
  end

  scenario 'User can change details and it appears on the profile' do
    fill_in 'Name', with: 'New name'
    fill_in 'Username', with: 'New username'
    fill_in 'Website', with: 'newwebsite.com'
    fill_in 'Bio', with: 'New Bio!!'
    click_button('Submit')
    expect(page).to have_content 'New name'
    expect(page).to have_content 'New username'
    expect(page).to have_content 'newwebsite.com'
    expect(page).to have_content 'New Bio!!'
  end
 
end
