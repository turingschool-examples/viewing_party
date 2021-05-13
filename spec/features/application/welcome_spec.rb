require 'rails_helper'

RSpec.describe 'welcome page' do
  context "you go to main page" do
    before :each do
      visit root_path
    end

    it "has welcome message" do
      expect(page).to have_content("Welcome to ViewingParty")
    end

    it "has application discription" do
      expect(page).to have_content("The app for planing movie parties with your friends!")
    end

    context "you arrive at page for first time" do
      it "has link to register a new user" do

        click_on "Register new user"
        expect(current_path).to eq(register_path)
      end

      it "has link for existing user to login" do
        click_on("Login")
        expect(current_path).to eq(login_path)
      end
    end
  end

  context "when you are allready logged in" do
    before :each do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit root_path
    end

    it "has no login and no register link" do
      expect(page).to_not have_link("Login")
      expect(page).to_not have_link("Register new user")
    end

    it "has a log out link" do
      expect(page).to have_link("Logout")
    end

    it "logout link works" do
      click_on "Logout"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("You have successfully logged off.")
    end
  end
end
