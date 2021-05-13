require 'rails_helper'

RSpec.describe 'Login page' do
  before :each do
    visit '/login'
    email = "example@example.com"
    password = "test"
    @user = User.create!(email: email, password: password)
  end

  describe 'when I visit the login page' do
    it 'I enter correct email and password' do
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Log In"

      expect(current_path).to eq('/dashboard')
    end
  end
end
