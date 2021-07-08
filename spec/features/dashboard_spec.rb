require 'rails_helper'

describe 'dashboard page' do
  before(:each)do

  end

  it 'has button to Discover Movies, headers' do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit '/dashboard'
    # save_and_open_page
    expect(page).to have_content("Welcome test123!")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("Friends")
    expect(page).to have_content("Viewing Parties")
  end

  it 'has Logout link that goes to Welcome Page' do
    user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit '/dashboard'

    expect(page).to have_link("Log out")
    click_link("Log out")

    expect(current_path).to eq("/")
    expect(page).to_not have_link("Log out")
    expect(page).to have_link("New to Viewing Party? Register Here")
  end
end
