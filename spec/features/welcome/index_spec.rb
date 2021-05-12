require 'rails_helper'

RSpec.describe 'Welcome page' do
  describe 'when a user visits the root path' do
    it 'displays a welcome message, description, button to log_in and link_to registration' do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Explore movies and create a viewing party event for you and your friends to watch a movie together!")
      expect(page).to have_button('Log in')
      expect(page).to have_link('Register', href: register_path)
    end
  end
end