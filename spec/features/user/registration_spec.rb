require "rails_helper"

describe "Registration page" do
  describe "happy path" do
    it "redirects to dashboard upon successful registration" do
      email = "me@example.com"
      password = "Ilikedogs123"
      visit new_user_path
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password
      click_button "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, #{email}")
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
        fill_in :user_email, with: ""
        fill_in :user_password, with: @password
        fill_in :user_password_confirmation, with: @password
        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
      end

      it "there is no password" do
        fill_in :user_email, with: @email
        fill_in :user_password, with: ""
        fill_in :user_password_confirmation, with: ""
        click_button "Create Account"

        expect(current_path).to eq(new_user_path)
      end

      it "passwords do not match" do
        fill_in :user_email, with: @email
        fill_in :user_password, with: @password
        fill_in :user_password_confirmation, with: "Ilikecats123"
        click_button "Create Account"

        expect(current_path).to eq(new_user_paths)
      end
    end
  end
end
