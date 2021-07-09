require 'rails_helper'

RSpec.describe 'login process' do
  describe 'login process' do
    describe 'reaching login' do
      it 'is found through the welcome page' do
        visit '/'

        expect(page).to have_link('I already have an Account')

        click_on 'I already have an Account'

        expect(page).to have_current_path('/login')
      end
    end
    describe 'logging in with valid credentials' do
      it 'logs me in and moves me to my show page' do
        user = User.create(email: 'test@turing.com', password: 'tester')

        visit '/login'

        fill_in :email, with: 'test@turing.com'
        fill_in :password, with: 'tester'

        click_on 'Log in'

        expect(page).to have_current_path("/dashboard", ignore_query: true)
        expect(page).to have_button('Log out')
      

        visit '/'

        expect(page).to_not have_link("I already have an Account")
        expect(page).to have_button('Log out')

      end
    end
    describe 'logging in with invalid credentials' do
      it 'returns to the login with an error message' do
        user = User.create(email: 'test@turing.com', password: 'tester')

        visit '/login'

        fill_in :email, with: 'test@turing.com'
        fill_in :password, with: 'test'

        click_on 'Log in'

        expect(page).to have_current_path("/login")
        expect(page).to have_content("Your username or password are incorrect")
      end
    end
    describe 'logging out' do
      it 'overwrites my session if I logout' do
        user = User.create(email: 'test@turing.com', password: 'tester')

        visit '/login'

        fill_in :email, with: 'test@turing.com'
        fill_in :password, with: 'tester'

        click_on 'Log in'
        click_on 'Log out'

        expect(page).to have_current_path('/')
        expect(page).to have_link('I already have an Account')
        expect(page).to_not have_button('Log out')
      end
    end
  end
end
