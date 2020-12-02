require 'rails_helper'

RSpec.describe 'User Log In and Log Out' do
  before :each do
    @user = User.create!(email: "John@example.com", password: "password")
  end
  describe 'A registered user can log in' do
    it "I can login with correct credentials" do
      visit root_path

      # expect(page).to_not have_content("Log Out")
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{@user.email}!")
      # expect(page).to have_content("Log Out")
    end
  end
end
