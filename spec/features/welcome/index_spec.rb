require 'rails_helper'

RSpec.describe "welcome index page" do
  describe "" do
    it "has a welcome message,  brief description of app, link to registration, button for login" do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("A place to plan movie nights with your friends!")

    end
    it "link to registration" do
      visit root_path

      expect(page).to have_link("Register")
      click_link("Register")
      expect(current_path).to eq(new_user_path)
    end

    xit "has button for logging in" do
      visit root_path

      expect(page).to have_button("Login")
      click_button("Login")
      expect(current_path)
    end
  end
end
