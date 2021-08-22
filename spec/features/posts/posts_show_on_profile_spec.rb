require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    create(:user)
    visit '/'
    find('.sign-in').click
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  scenario 'posts show on a users profile' do
    find('.new-post').click
    attach_file('Image', 'spec/files/images/attachment.jpeg')
    fill_in 'post_caption', with: "Live laugh love!!!"
    click_button 'Create Post'
    find('.user-icon').click
    expect(page).to have_css("img[src*='attachment.jpeg']")
  end
end