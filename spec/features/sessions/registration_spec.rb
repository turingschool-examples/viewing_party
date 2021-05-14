require 'rails_helper'

RSpec.describe 'Show Registration Form' do
  describe 'I can create a new user' do
    it 'can create a new user without error' do
      visit root_path

      click_link 'New User? Click this link to Register'

      expect(current_path).to eq('/register')

      fill_in 'user[user_name]', with: 'joeyh@gmail.com'
      fill_in 'user[password]', with: 'Password'
      fill_in 'user[password_confirmation]', with: 'Password'

      click_button 'Register'

      # This needs to be changed to equal to the user dashboard, based on the session ID
      expect(current_path).to eq(dashboard_path)
      user = User.last
      expect(user.user_name).to eq('joeyh@gmail.com')
    end
  end
end
