require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Dashboard Page' do
  describe 'As a user' do
    before :each do
      @user = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a')

      visit root_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password

      click_button "Log In"
    end

    it "I can see a personalized welcome message" do
      expect(page).to have_content('Welcome, Jackie Chan, you are logged in!')
    end

  end

end
