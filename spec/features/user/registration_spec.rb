require 'rails_helper'

RSpec.describe 'User Registration' do 
    describe 'happy path' do
        it 'allows a user to register' do
            visit root_path

            click_link 'Register Here'

            expect(current_path).to eq(new_user_path)

            email = 'buffyslayer@example.com'
            name = 'Buffy'
            password = 'turing123'

            save_and_open_page

            fill_in :user_email, with: email
            fill_in :user_name, with: name
            fill_in :user_password, with: password

            click_button 'Create User'

            expect(current_path).to eq(dashboard_path)
            expect(page).to have_content("Welcome, #{name}")
        end
    end
end