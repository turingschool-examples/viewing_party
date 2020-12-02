require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    it "I see discover movies button, friends search bar, add friend button, and my viewing parties tab" do
      expect(current_path).to eq(dashboard_path)

      expect(page).to have_button("Discover Movies")
      expect(page).to have_button("Add Friend")
      expect(page).to have_field("Friend's Email")
      expect(page).to have_content("Viewing Parties")
    end
  end
end
