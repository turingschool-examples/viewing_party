require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Login' do
  describe 'As a user' do
    before :each do
      @user = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a', password_confirmation: 'a')

      visit root_path
    end


    it "I can fill in my information, click the Log In button, and be logged in" do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password

      click_button "Log In"

      expect(current_path).to eq("/user/dashboard")
    end

    describe "If already logged in" do
      it "I see a flash message indicating I'm already logged in" do

        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password

        click_button "Log In"

        visit root_path

        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password

        click_button "Log In"

        expect(current_path).to eq("/user/dashboard")
        expect(page).to have_content("You are already logged in")
      end
    end

    describe "If I attempt to login with invalid credentials" do
      it "I see a flash message indicating I cannot log in" do

        fill_in 'Email', with: 'incorrect_email'
        fill_in 'Password', with: @user.password

        click_button "Log In"

        expect(current_path).to eq(root_path)
        expect(page).to have_content('Sorry, your credentials are bad.')
      end
    end
  end
end
