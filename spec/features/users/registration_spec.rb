require 'rails_helper'

RSpec.describe 'User registration page', type: :feature do
  describe 'As a visitor' do
    it 'I can register a new user' do
        visit '/register'

        email = "hackerman88@hotmail.com"
        password = "password"
        password_confirm = "password"

        fill_in "Email", with: email
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password_confirm
        click_button "Register New User"
        expect(current_path).to eq('/dashboard')
    end

    it 'I cant create a user if all fields are not filled in' do
        visit '/register'

        email = ""
        password = "password"
        password_confirm = "password"

        fill_in "Email", with: email
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password_confirm

        click_button "Register New User"

        expect(current_path).to eq('/register')
        expect(page).to have_content("Email can't be blank")
        expect(page).to have_button("Register New User")
    end

    it 'I cant create a user if there is a duplicate email' do
        user_1 = User.create({email: "hackerman88@hotmail.com", password: "1234abcd"})

        visit '/register'

        email = "hackerman88@hotmail.com"
        password = "password"
        password_confirm = "password"

        fill_in "Email", with: email
        fill_in "Password", with: password
        fill_in "Password confirmation", with: password_confirm

        click_button "Register New User"

        expect(current_path).to eq('/register')

        expect(page).to_not have_xpath("//input[@value='hackerman88@hotmail.com']")
        expect(page).to_not have_xpath("//input[@value='password']")
    end
  end
end
