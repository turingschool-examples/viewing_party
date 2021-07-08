require 'rails_helper'

RSpec.describe 'User Registration form' do

    it 'is accessed through from the root' do
        visit root_path

        click_on 'Register New Account'

        expect(page).to have_current_path('/register')
        expect(page).to have_button('Register')
    end

  describe "submitting form " do
    describe "happy path" do
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

    describe "sad paths" do
      it 'requires email to be filled out' do
        visit '/register'

        password = 'foobar'

        fill_in 'user[password]', with: password

        click_on 'Register'

        expect(page).to have_content("Email can't be blank")
      end

      it 'requires email to be unique ' do
        user = User.create(email: 'test@turing.com', password: 'password')

        visit '/register'

        email = 'test@turing.com'
        password = 'foobar'

        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password

        click_on 'Register'

        expect(page).to have_content("invalid email or password")
      end

      it 'requires passwords to be filled out ' do
        visit '/register'

        email = 'test@turing.com'

        fill_in 'user[email]', with: email

        click_on 'Register'

        expect(page).to have_content("Password can't be blank")
      end

      # it 'requires passwords to match  ' do
      # end
    end

  end
end
