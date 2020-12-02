require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the root welcome page" do
    it "I see a message welcoming me to the site" do
      visit root_path

      expect(page).to have_content('Welcome to Viewing Party!')
    end
    
    it "I see fields to login" do
      visit root_path

      within '#description' do
        expect(page).to have_content('Finally, a place where you can enjoy all your favorite movies with all your best friends!')
      end

      expect(page).to  have_field(:email)
      expect(page).to  have_field(:password)
      expect(page).to  have_button('Sign In')
    end
    
    it "I see a link to register as a new user" do
      visit root_path

      expect(page).to  have_link('New to Viewing Party? Register Here!')
    end

    xit "When I click the register new user link, I am taken to the register new user page" do
      visit root_path
      
      click_link('New to Viewing Party? Register Here!')
      expect(current_path).to eq("/registration")
    end

    xit "When I enter valid login information and submit, I am redirected to the user dashboard" do
      visit root_path

      fill_in :email,	with: "sometext" 
      fill_in :password,	with: "sometext"
      click_button 'Sign In'

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content('Login Successful!')
    end
  end
end
