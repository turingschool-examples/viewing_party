require "rails_helper"

RSpec.describe 'As a user' do
  describe "When I visit the root path" do
    it "I should see a welcome page with a brief description of the application." do
      visit root_path
      expect(page).to have_content("Viewing Party is an application that allows users to create and watch movies with other users integrated with Google Calender")
    end

    it "I should see a button to Log In with Google" do
      visit root_path
      expect(page).to have_link("Login")
    end
  end
end
