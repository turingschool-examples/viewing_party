require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  describe 'when I visit my dashboard' do
    it 'I see a button to Discover Movies' do
      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_button('Discover Movies')
    end

    it 'Discover Movies button redirects me to Discover Page' do
      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"
      click_button "Discover Movies"

      expect(current_path).to eq('/discover')
    end
  end

  describe 'sad path and edge case' do
    it 'shows non-authorized message for dashboard path' do
      visit '/dashboard'

      not_authorized = "You must be logged in to view your dashboard"

      expect(current_path).to eq('/')
      expect(page).to have_content(not_authorized)
    end
  end
end
