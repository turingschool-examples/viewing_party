require 'rails_helper'

RSpec.describe 'As any user' do
  describe 'When I visit the landing page' do
    before :each do
      visit "/"
    end

    it 'Shows me a welcome page' do

      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_content("Watch movies with your friends.")
    end

    it 'Shows a button to log in with google' do

      expect(page).to have_button("Log In with Google")
    end
  end
end
