require 'rails_helper'

describe 'User Registration' do
  describe 'As a visitor' do
    it 'shows a form to register as a new user, and when I enter valid information I am redirected to the dashboard' do
      visit '/registration'

      fill_in 'First name', with: 'Sam'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Email', with: 'sam@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Register'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Welcome, Sam!')
    end

    it 'displays an error if any required field is left blank' do
      visit '/registration'

      fill_in 'First name', with: 'Sam'

      click_button 'Register'

      expect(page).to have_content("Last name can't be blank")
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
    end

    xit 'displays an error if the email provided already exists in the database' do

    end

    xit 'displays an error if the two passwords do not match' do

    end
  end
end
