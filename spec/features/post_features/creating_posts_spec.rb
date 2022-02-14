require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do 
    visit('users/new')
    fill_in 'Name', with: 'Test name'
    fill_in 'Username', with: 'Username'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Do it!!'
    
    click_link 'New post!'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    click_button 'Create Post'
    
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end

  scenario 'can\'t create post without image attached' do
    visit('users/new')
    fill_in 'Name', with: 'Test name'
    fill_in 'Username', with: 'Username'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Do it!!'
    
    click_link 'New post!'
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    click_button 'Create Post'
    
    expect(page).to_not have_content('#coffeetime')
  end
end