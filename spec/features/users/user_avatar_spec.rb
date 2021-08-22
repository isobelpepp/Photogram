require 'rails_helper.rb'

feature 'Adding a user avatar' do
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
  scenario 'avatar shows on users page' do
    attach_file('Avatar', 'spec/files/images/attachment.jpeg')
    click_button('Submit')
    expect(page).to have_css("img[src*='attachment.jpeg']")
  end
  scenario 'clicking on an avatar takes you to the profile of the user' do
    attach_file('Avatar', 'spec/files/images/attachment.jpeg')
    click_button('Submit')
    expect(page).to have_css("img[src*='attachment.jpeg']")
    visit '/'
    find(:xpath, "//a[contains(@href,'users/1')]").click
    expect(current_path).to eq('/users/1')
  end
end
