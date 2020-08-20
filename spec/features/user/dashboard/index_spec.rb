require 'rails_helper'

RSpec.describe 'As a verified user' do
  describe 'When I log in' do
    it 'see\s a dashboard that welcomes me' do
      stub_omniauth
      visit root_path
      expect(page).to have_link("Sign in with Google")
      click_link "Sign in with Google"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome Tony Stark!")
    end
  end
end
