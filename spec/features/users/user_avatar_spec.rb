require 'rails_helper.rb'

feature 'Creating posts' do
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
  scenario 'posts show on a users profile' do
    attach_file('Avatar', 'spec/files/images/attachment.jpeg')
    click_button('Submit')
    expect(page).to have_css("img[src*='attachment.jpeg']")
  end
end
