require 'rails_helper'

RSpec.describe "dashboard" do
  describe "as a user (happy path)" do
    before(:each) do
      visit root_path
      User.create(email: "somedude@example.com", password: "")
      click_link("Register")
      fill_in(:email, with: "somedude@example.com")
      fill_in(:password, with: "password123")
      fill_in(:password_confirmation, with: "password123")
      click_button("Create Account")

      visit root_path

      fill_in(:email, with: "somedude@example.com")
      fill_in(:password, with: "password123")
      click_button("Log In")
    end

    it "" do

    end

  end
end