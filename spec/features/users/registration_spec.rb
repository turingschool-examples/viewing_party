require 'rails_helper'

RSpec.describe 'Registration Page' do
  before :each do

    visit "/registration"
  end

  describe 'User visits the registration page' do
    it 'can see a form to register' do
      expect(current_path).to eq('/registration')

      email = "example@example.com"
      password = "test"
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      click_button "Register"

      expect(current_path).to eq('/dashboard')
    end
  end
end
