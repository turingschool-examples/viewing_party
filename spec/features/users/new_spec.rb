require 'rails_helper'

describe "As a visitor" do
  describe "I visit the welcome page and see a link to register" do
    it "I click the link, fill in details, and click register" do
      visit '/'
      click_link("New to Viewing Party? Register Here.")

      expect(current_path).to eq('/registration')

      fill_in :username, with: "John Doe"
      fill_in :email, with: "john@doe.com"
      fill_in :password, with: "password"
      fill_in :password_confirmation, with: "password"
      click_on 'Create User'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Welcome John Doe!')
    end
  end
end
