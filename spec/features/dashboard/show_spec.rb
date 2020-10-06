require 'rails_helper'

RSpec.describe 'authenticated user dashboard', type: :feature do
  describe 'shows welcome message' do
    it 'has button to discover movies' do
      user = create :user

      visit '/'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log in'

      expect(page).to have_content("Welcome, #{user.email}")
      expect(page).to have_button('Discover Movies')

      click_button 'Discover Movies'

      expect(current_path).to eq('/discover')
      require "pry"; binding.pry
    end
  end
end
