require 'rails_helper'

describe 'User Registration' do
  describe 'As a visitor' do
    it 'shows a form to register as a new user, and when I enter valid information I am redirected to the dashboard' do
      visit '/registration'

      fill_in 'Email', with: 'sam@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Register'

      expect(current_path).to eq('/dashboard')
    end

    xit 'displays an error if the email is blank' do

    end

    xit 'displays an error if the email provided already exists in the database' do

    end

    xit 'displays an error if the two passwords do not match' do

    end
  end
end
