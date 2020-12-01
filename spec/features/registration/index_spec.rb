require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'As a visitor' do
    before(:each) do
      visit '/registration'
    end

    it "I can register as a new user" do
      fill_in :email, with: 'testing@example.com'
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'

      click_button('Register')

      expect(current_path).to eq('/dashboard')
    end
  end
end
