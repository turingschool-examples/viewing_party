require "rails_helper"

describe "Registration page" do
  describe "happy path" do
    it "redirects to dashboard upon successful registration" do
      email = "me@example.com"
      password = "Ilikedogs123"
      visit new_user_path
      fill_in :"user[email]", with: email
      fill_in :"user[password]", with: password
      fill_in :"user[password_confirmation]", with: password
      click_button "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{email}")
      click_link "Log out"
      expect(page).to have_content("You are now logged out.")
      expect(current_path).to eq(root_path)
    end
  end

  describe "sad path" do
    describe "keeps user on same page and displays error message when" do
      before :each do
        @email = "me@example.com"
        @password = "Ilikedogs123"
        visit new_user_path
      end

      it "there is no email" do
        fill_in :"user[email]", with: ""
        fill_in :"user[password]", with: @password
        fill_in :"user[password_confirmation]", with: @password
        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
      end
      :"user[name]"
      it "there is no password" do
        fill_in :"user[email]", with: @email
        fill_in :"user[password]", with: ""
        fill_in :"user[password_confirmation]", with: ""
        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
      end

      it "passwords do not match" do
        fill_in :"user[email]", with: @email
        fill_in :"user[password]", with: @password
        fill_in :"user[password_confirmation]", with: "Ilikecats123"
        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
      end
    end
  end
end
