require 'rails_helper'

RSpec.describe 'After logging in' do
  describe 'I am redirected to my dashboard' do
    it 'and it displays my name, a button to discover movies, friends, and viewing parties' do
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider     => 'google_oauth2',
        :uid => ENV['GOOGLE_UID'],
        :info => {:name => 'Michael Evans', :email => 'michaeljevans113@gmail.com'},
        :credentials => {:token => ENV['GOOGLE_TOKEN']}
        })

      visit '/'

      click_button 'Log In with Google'

      expect(current_path).to eq('/dashboard')

      expect(page).to have_content('Welcome, Michael Evans!')
      expect(page).to have_button('Discover Movies')
      expect(page).to have_css('.friends')
      expect(page).to have_css('.viewing-parties')
    end
  end
end
