require 'rails_helper.rb'
feature 'Adding a user avatar' do
  background do
    create(:post)
    visit '/'
    find('.sign-in').click
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    find('.new-post').click
    attach_file('Image', 'spec/files/images/attachment.jpeg')
    fill_in 'post_caption', with: "Live laugh love!!!"
    click_button 'Create Post'
    find('.user-icon').click
  end
  scenario 'clicking on an avatar takes you to the profile of the user' do
    find(:xpath, "//a[contains(@href,'/posts/1')]").click
    expect(page).to have_content('Live laugh love!!!')
  end
end
