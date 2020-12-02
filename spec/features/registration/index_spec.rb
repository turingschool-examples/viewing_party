require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'As a visitor' do
    before(:each) do
      visit '/registration'
    end

    it 'I can register as a new user' do
      
      fill_in 'user[email]', with: 'testing@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button('Register')

      expect(current_path).to eq('/dashboard')
    end
  end
end
