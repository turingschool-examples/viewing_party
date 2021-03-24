require 'rails_helper'

describe "When a user visits the registration path" do
  describe "has a form with email, password and password confirmation" do
    it "and I can create a user when I enter valid information" do
      visit registration_path

      fill_in "user[email]", with: "some@stuff.com"
      fill_in "user[password]", with: "456tuff"
      fill_in "user[password_confirmation]", with: "456tuff"
      click_button "Register"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Welcome to Viewing Party, some@stuff.com")
    end

    it "and I cannot create user without a valid email" do
      visit registration_path

      fill_in "user[email]", with: "somestuff"
      fill_in "user[password]", with: "456tuff"
      fill_in "user[password_confirmation]", with: "456tuff"
      click_button "Register"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Please enter valid information to create an acccount")
    end

    it "and I cannot create user without an email or password" do
      visit registration_path

      click_button "Register"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Please enter valid information to create an acccount")
    end

    it "and I cannot create user without an accurate password confirmation" do
      visit registration_path

      fill_in "user[email]", with: "some@stuff.com"
      fill_in "user[password]", with: "456tuff"
      fill_in "user[password_confirmation]", with: "123tuff"
      click_button "Register"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Please enter valid information to create an acccount")
    end
  end
end
