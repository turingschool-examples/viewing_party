require 'rails_helper'

RSpec.describe 'welcome page' do
  describe 'display' do
    it 'shows welcome message' do
      visit root_path
      expect(page).to have_content("welcome")
    end
  end

  describe 'login' do
    it 'can login to valid user account with credentials' do
      email = 'test@test.com'
      pswd = 'test'
      user = User.create!(email: email, password: pswd)

      visit root_path

      fill_in :email, with: email
      fill_in :password, with: pswd
      click_on 'Submit'

      expect(page).to have_content("Welcome, #{email}!")
      expect(current_path).to eq(dashboard_index_path)
    end

    it 'cannot log in with bad credentials' do
      email = 'test@test.com'
      pswd = 'test'
      user = User.create!(email: email, password: pswd)

      visit root_path

      fill_in :email, with: email
      fill_in :password, with: 'yay'
      click_on 'Submit'

      expect(page).to have_content("Incorrect password!")
      expect(current_path).to eq(root_path)
    end
  end
end
