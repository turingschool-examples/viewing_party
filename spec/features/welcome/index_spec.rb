require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit '/'" do 
    it 'I see a welcome message' do
      visit '/'

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("This application allows you and your friends to have a movie watch party during a pandemic, and give you the comfort to watch from home.")
    end
    it 'I see a button to login and link to register' do
      visit '/'

      expect(page).to have_button("Login")
      expect(page).to have_link("Register")
    end
  end
end
