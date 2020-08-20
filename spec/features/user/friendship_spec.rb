require 'rails_helper'

RSpec.describe "As a registered user " do
  describe "when I vist my dashboard I see a friends area" do
    it "allows me to enter an email and add friend" do
      OmniAuth.config.test_mode = true

      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider     => 'google_oauth2',
        :uid => '12345',
        :info => {:name => 'Jane Greene', :email => 'janegreenecasa@gmail.com'},
        :credentials => {:token => '456789'}
        })

      visit '/'

      click_button 'Log In with Google'

      user = User.last
      visit '/logout'

      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
        :provider     => 'google_oauth2',
        :uid => '88888',
        :info => {:name => 'Second User', :email => 'user2@gmail.com'},
        :credentials => {:token => '99999'}
        })

      click_button 'Log In with Google'
      user_2 = User.last

      expect(current_path).to eq('/dashboard')

      within ".friends" do
        fill_in "Email", with: 'janegreenecasa@gmail.com'
        click_button "Add Friend"
        expect(page).to have_content("Jane Greene")
      end

      within ".friends" do
        fill_in "Email", with: 'junk@gmail.com'
        click_button "Add Friend"
      end
      expect(page).to have_content("Sorry your friend cannot be found.")
    end
  end

end
