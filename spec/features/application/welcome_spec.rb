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

        fill_in "user[email]", with: "555@dooffus.edu"
        fill_in "user[password]", with: "password"
        fill_in "user[name]", with: "The Doof"
        click_on("Register")

        expect(current_path).to eq(root_path)
      end
  
      it "allows existing user to login" do
        user = create(:user)

        click_on("Login")
        expect(current_path).to eq(login_path)

        fill_in("Email"), with: "#{user.email}"
        fill_in("Password"), with: "#{user.password}"

        click_on("Login")
        expect(current_path).to eq(root_path)
      end
  #   end
  #
  #   context "when you are allready logged in" do
  #     before :each do
  #       @user = create(:user)
  #       visit root_path
  #
  #       click_on("Login")
  #       fill_in("Email"), with: "#{user.email}"
  #       fill_in("Password"), with: "#{user.password}"
  #
  #       click_on("Login")
  #     end
  #     it "has no login and no register link" do
  #
  #       expect(page).to_not have_link("Login")
  #       expect(page).to_not have_link("Register new user")
  #     end
  #
  #     it "has a log out link" do
  #       expect(page).to have_link("Logout")
  #     end
  #
    end
  end
end
