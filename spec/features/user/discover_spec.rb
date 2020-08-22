require 'rails_helper'

RSpec.describe 'After logging in' do
  describe 'I visit my dashboard and click the Discover Movies button' do
    it 'and it takes me to a discover page' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        Faker::Omniauth.google
      )

      visit '/'

      click_button 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      click_button 'Discover Movies'

      expect(current_path).to eq('/discover')
      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_button('Find Movies')
    end
  end
end
