require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'as a visitor' do
    it 'allows me to register for an account' do
      visit new_user_path

      fill_in 'user[email]', with: 'me@gmail.com'
      fill_in 'user[password]', with: 'password'

      click_on 'Create User'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Your account has been successfully created.')
    end
  end
end
