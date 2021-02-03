require 'rails_helper'

RSpec.describe 'User login' do
    describe 'happy path' do
        it 'allows users to login' do
            user = User.create(name: 'Buffy', email: "buffyslayer@example.com", password: "test")

            visit root_path

            click_link 'Log In'

            expect(current_path).to eq(login_path)

            fill_in :email, with: user.email.upcase
            fill_in :name, with: user.name.upcase
            fill_in :password, with: user.password

            click_button 'Log In'

            #should go to dashboard
            expect(current_path).to eq(dashboard_path)
            expect(page).to have_content("Welcome, #{user.email}")
            expect(page).to have_link("Log out")
            expect(page).to_not have_link("Register Here")
            expect(page).to_not have_link("Log In")

            click_link 'Log out'

            expect(current_path).to eq(root_path)
            expect(page).to have_link("Register as a User")
            expect(page).to have_link("I have an account")


        end
    end

    describe 'sad path' do
        it 'block login if bad credentials' do
            user = User.create(name: 'Buffy', email: "buffyslayer@example.com", password: "test")

            visit root_path

            click_link 'Log In'

            expect(current_path).to eq(login_path)

            fill_in :email, with: user.email
            fill_in :name, with: user.name
            fill_in :password, with: 'bad password'

            click_button 'Log In'

            expect(current_path).to eq(login_path)
            expect(page).to have_content("Your credentials are bad, and you should feel bad")
        end
    end
end
