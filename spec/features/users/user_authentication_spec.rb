require 'rails_helper'

feature 'User authentication' do
  background do
    create(:user)
    visit '/'
    find('.sign-in').click
  end
  scenario 'can log in from the index' do 
    expect(current_path).to eq('/users/sign_in')
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq('/')
  end

  scenario 'stays on log in page given wrong email or password' do
    fill_in 'Email', with: 'wrongemail@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(current_path).to eq('/users/sign_in')
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log in'
    expect(current_path).to eq('/users/sign_in')
  end

  scenario 'can log out once logged in' do
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    find('.sign-out').click
    expect(page).to have_content 'You are not logged in.'
  end
end
