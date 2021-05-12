require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before :each do

    visit "/"
  end

  describe 'when I visit the welcome page' do
    it 'displays a welcome message and brief description of the application' do
      welcome_message = "Welcome to Viewing Party!"
      description = "Within this app, you will be able to explore movies and create a viewing party event for you and your friends to watch a movie together."
      expect(page).to have_content(welcome_message)
      expect(page).to have_content(description)
    end

    it 'displays button to log in and link to register' do
      expect(page).to have_button("Log In")
      expect(page).to have_link("Register as New User", href: "/registration")
    end
  end
end
