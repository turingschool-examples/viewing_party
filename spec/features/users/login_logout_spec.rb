require 'rails_helper'

RSpec.describe 'User Log In and Log Out' do
  before :each do
    @user = User.create!(email: "John@example.com", password: "password")
  end

  describe 'A registered user can log in' do
    it "I can login with correct credentials" do
      visit root_path

      expect(page).to_not have_link("Log Out")
      expect(page).to_not have_link("Dashboard")

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{@user.email}!")
      expect(page).to have_link("Log Out")
      expect(page).to have_link("Dashboard")
    end

    it "I cannot log in with bad credentials" do
      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: "WROOOONG"

      click_button("Log In")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Incorrect login information")
    end
  end

  describe 'A logged in user can log out' do
    it "I can log out" do
      visit root_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log In'

      visit root_path

      expect(page).to_not have_button("Log In")

      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You have been logged out!')
      expect(page).to have_button("Log In")
    end
  end
end
