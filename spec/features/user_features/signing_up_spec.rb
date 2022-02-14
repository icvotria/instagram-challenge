require 'rails_helper.rb'

feature 'Signing up' do
  scenario 'a user can sign up' do
    visit('users/new')
    fill_in 'Name', with: 'Test name'
    fill_in 'Username', with: 'Username'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Do it!!'
    expect(page).to have_content('Thanks for signing up! Welcome to InstaBAM!!')
  end

  scenario 'sign up fails if they put an invalid email' do
    visit('users/new')
    fill_in 'Name', with: 'Test name'
    fill_in 'Username', with: 'Username'
    fill_in 'Email', with: 'email'
    fill_in 'Password', with: 'password'
    click_button 'Do it!!'
    expect(page).to have_content('Something went wrong! Please try again')
  end
end