require 'rails_helper'
    
RSpec.describe 'show registration form' do

  describe 'i can create a new user' do
    it 'can create a new user without error' do
        visit root_path

        click_link "Register"

        expect(current_path).to eq("/register")

        fill_in 'user[user_name]', with: "joeyh@gmail.com"
        fill_in 'user[password]', with: "Password"
        fill_in 'user[password_confirmation]', with: "Password"


        click_button "Register"
        # This needs to be changed to equal to the user dashboard, based on the session ID
        expect(current_path).to eq(root_path)
        user = User.last
        expect(user.user_name).to eq("joeyh@gmail.com")
      end
    end
  end