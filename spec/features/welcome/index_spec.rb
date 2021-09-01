require 'rails_helper'

RSpec.describe 'welcome page' do
  describe 'display' do
    it 'shows welcome message' do
      visit root_path
      expect(page).to have_content("Welcome to our project")
    end
  end

  describe 'login and logout' do
    it 'can login and logout to valid user account with credentials' do
      email = 'test@test.com'
      pswd = 'test'
      user = User.create!(email: email, password: pswd)

      visit root_path

      fill_in :email, with: email
      fill_in :password, with: pswd
      click_on 'Login'

      expect(page).to have_content("Welcome, #{email}!")
      expect(current_path).to eq(dashboard_index_path)

      click_link "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to_not have_link('Logout')
      expect(page).to have_link('New? Register here')
      expect(page).to have_button('Login')
    end

    describe 'logged in user' do
      it 'does not show log in or register user content during a logged in session' do
        email = 'test@test.com'
        pswd = 'test'
        user = User.create!(email: email, password: pswd)

        visit root_path

        fill_in :email, with: email
        fill_in :password, with: pswd
        click_on 'Login'

        visit root_path

        expect(page).to have_link('Logout')
        expect(page).to have_content("You are already logged in under #{email}!")
        expect(page).to_not have_link('New? Register here')
        expect(page).to_not have_button('Login')
      end
    end

    it 'cannot log in with bad credentials' do
      Capybara.run_server = false
      email = 'test@test.com'
      pswd = 'test'
      user = User.create!(email: email, password: pswd)

      visit root_path

      fill_in :email, with: email
      fill_in :password, with: 'yay'
      click_on 'Login'
      expect(page).to have_content("No matching account!")
      expect(current_path).to eq(root_path)
    end
  end
end
