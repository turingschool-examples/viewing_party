require 'rails_helper'

RSpec.describe 'User Registration form' do
    it 'is accessed through from the root' do
        visit root_path

        click_on 'Register New Account'

        expect(page).to have_current_path('/register')
        expect(page).to have_button('Register')
    end

    it 'creates a new user' do
        visit '/register'

        email = 'test@turing.com'
        password = 'foobar'

        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password

        click_on 'Register'

        expect(page).to have_content("Welcome, #{email}!")
    end
end