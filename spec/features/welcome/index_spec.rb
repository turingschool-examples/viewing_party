require 'rails_helper'

RSpec.describe('Welcome Page') do
  describe 'happy path' do
    it 'should display the welcome page with message and description' do
      visit root_path

      expect(page).to have_content('Welcome to Viewing Party')
      expect(page).to have_content('For this project, you will be building an application to explore movies and create a viewing party event for you and your friends to watch a movie together. The application will require basic authentication.')
    end

    it 'should have a Log In button that takes us to the login form' do
      visit root_path

      expect(page).to have_button('Log In')

      click_button 'Log In'

      expect(current_path).to eq(login_path)
    end

    it 'should have a registration link that takes us to the registration page' do
      visit root_path

      expect(page).to have_link('Register Here')

      click_link 'Register Here'

      expect(current_path).to eq(new_user_path)
    end
  end
end
