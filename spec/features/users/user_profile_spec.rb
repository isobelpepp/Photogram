require 'rails_helper'

feature 'User authentication' do
  background do
    create(:user)
    visit '/'
    find('.sign-in').click
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  scenario 'clicking on profile icon will take you to profile' do
    find('.user-icon').click
    expect(page).to have_content 'Test'
    expect(page).to have_content 'example.com'
    expect(page).to have_content 'This is my bio'
    expect(current_path).to eq('/users/1')
  end
end
