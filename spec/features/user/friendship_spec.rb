require 'rails_helper'

RSpec.describe 'As a registered user,' do
  describe 'when I vist my dashboard, I see a friends area' do
    it 'and it allows me to enter an email to add a friend' do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        Faker::Omniauth.google
      )

      visit '/'

      click_button 'Log In with Google'

      user = User.last

      visit '/logout'

      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        Faker::Omniauth.google
      )

      click_button 'Log In with Google'

      user_2 = User.last

      expect(current_path).to eq('/dashboard')

      within '.friends' do
        expect(page).to have_content('You currently have no friends')
        fill_in 'Email', with: user.email
        click_button 'Add Friend'
        expect(page).to have_content('You have a new friend!')
        expect(page).to have_content("#{user.name}")
      end

      within '.friends' do
        fill_in 'Email', with: 'junk@gmail.com'
        click_button 'Add Friend'
      end

      expect(page).to have_content('Sorry, your friend cannot be found.')
    end
  end

end
