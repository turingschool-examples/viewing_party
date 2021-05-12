require 'rails_helper'

describe 'User log in' do 
    it 'as a registered user, I can log in with an email and password. My password is stored with bcrypt' do 
        user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
        visit root_path

        click_button "Log in"

        expect(current_path).to eq(login_path)
        
        fill_in :user_name, with: "joeyh@test.com"
        fill_in :password, with: "doyouwanttohearasong"
        
        click_button "Log in"
        
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("Welcome joeyh@test.com!")
        expect(page).to_not have_link("I already have an account")
        expect(page).to_not have_link("Sign Up to Be a User")

      # IF ADDING LOG OUT FUNCTION: 
        # expect(page).to have_link("Log out")
        # click_link("Log out")
        # expect(current_path).to eq(root_path)
        # expect(page).to_not have_link("Log out")
        # expect(page).to have_button("Log in")
        # expect(page).to have_link("Register")
    end 

    it 'as a registered user, I cannot log in with incorrect credentials' do 
        user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
        
        visit root_path

        click_button "Log in"

        expect(current_path).to eq(login_path)
        
        fill_in :user_name, with: "joeyh@test.com"
        fill_in :password, with: "beetlejuice"
        
        click_button "Log in"
        
        expect(current_path).to eq(login_path)
        expect(page).to have_content("Your email or password are incorrect")
    end 
end 