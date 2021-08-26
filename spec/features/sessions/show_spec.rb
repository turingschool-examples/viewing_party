require 'rails_helper'
 RSpec.describe 'it can show details on a users dashboard' do
   before :each do

    visit "/"
   end

   it 'expect page to have link discover movies' do
    user = create(:user)

    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign In'
    
    expect(page).to have_link('Discover Movies')

    click_link('Discover Movies')

    expect(current_path).to eq('/discover')
   end

   it 'can find a log out button on the page' do
    user = create(:user)
     
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign In'

    expect(page).to have_link("Logout")

    click_link "Logout"
    
    expect(current_path).to eq("/")

    visit "/dashboard"

    expect(page).to have_content("Must be a user to access!")
    expect(page).to have_link("Log In Here")
   end

   it 'can add friends' do
    user = create(:user)
    user2 = create(:user)
     
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'Sign In'

    fill_in :friend, with: user2.email
    click_on :add_friend

    expect(current_path).to eq('/dashboard')

    within("#user-#{user2.id}")
      expect(page).to have_content(user2.email)
    end
 end
