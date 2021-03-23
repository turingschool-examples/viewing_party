require 'rails_helper'

RSpec.describe "Login" do
  before :each do
    @user = User.create!(name: "name", email: "email@gmail.com", password: "password")
  end

  describe "when I visit the welcome page it" do
    it "has a form to login in" do
      visit root_path

      within(".login") do
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
        expect(page).to have_button("Log In")
      end
    end

    it "redirects to user's dashboard upon successful login" do
      visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button("Log In")
      end

      expect(current_path).to eq(dashboard_path)
    end

    it "does not redirect user to user's dashboard upon unsuccessful login" do
      visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: "not password"
        click_button("Log In")
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Email or Password")
    end

    it "does not redirect if user doesn't exist" do
      visit root_path

      within(".login") do
        fill_in :email, with: "bob@gmail.com"
        fill_in :password, with: @user.password
        click_button("Log In")
      end

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid Email or Password")
    end

    it "will login with a case insensitive email" do
      visit root_path

      within(".login") do
        fill_in :email, with: "EmAiL@GmAiL.com"
        fill_in :password, with: @user.password
        click_button("Log In")
      end

      expect(current_path).to eq(dashboard_path)
    end
  end
end
