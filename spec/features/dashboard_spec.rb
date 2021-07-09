require 'rails_helper'

describe 'dashboard page' do
  it 'can not access dashboard without login' do
    visit dashboard_path
    expect(current_path).to_not eq(dashboard_path)
    expect(current_path).to eq(welcome_path)
  end

  describe 'dashboard page with login' do
    before(:each)do
      @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
      visit welcome_path
      fill_in :email, with: "test123@xyz.com"
      fill_in :password, with: "viewparty"
      click_button "Sign In"
      visit dashboard_path
    end

    it 'has button to Discover Movies, headers' do
      expect(page).to have_content("Welcome test123!")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Friends")
      expect(page).to have_content("Viewing Parties")
    end

    it 'has Logout link to Welcome Page' do
      expect(page).to have_link("Log out")
      click_link("Log out")

      expect(current_path).to eq(welcome_path)
      expect(page).to_not have_link("Log out")
      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end
  end
end
