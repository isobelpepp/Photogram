require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    find('.sign-in').click
    click_link 'Sign up'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(current_path).to eq('/')
  end
  scenario 'needs a correct email to sign up' do
    fill_in 'Email', with: 'email'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content "Email is invalid"
  end
  scenario 'password needs to be more than 6 characters' do
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'pass'
    fill_in 'user_password_confirmation', with: 'pass'
    click_button 'Sign up'
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
  end
  scenario 'passwords need to match' do
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password1'
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end
end
