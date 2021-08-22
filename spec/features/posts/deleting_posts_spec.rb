require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    create(:post)
    visit '/'
    find('.sign-in').click
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end
  scenario 'user can delete posts' do
    find('.user-icon').click
    find(:xpath, "//a[contains(@href,'/posts/1')]").click
    click_link 'Remove'
    visit '/'
    expect(page).not_to have_content 'Live laugh love!!!'
  end
end
