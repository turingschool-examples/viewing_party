require 'rails_helper'

RSpec.describe 'User Registration' do
  describe 'As a Visitor' do
    it "I can click link to register, and am taken to the register page" do
      visit root_path

      click_link "Register"

      expect(current_path).to eq("/register")
    end
    
    it 'I can register as a user' do
      visit register_path

      fill_in 'Name', with: 'Megan'
      fill_in 'Email', with: 'megan@example.com'
      fill_in 'Password', with: 'securepassword'
      fill_in 'Password confirmation', with: 'securepassword'
      click_button 'Register'

      expect(current_path).to eq('/user/dashboard')
      expect(page).to have_content('Hello, Megan!')
    end

    describe 'I can not register as a user if' do
      it 'I do not complete the registration form' do
        visit register_path

        fill_in 'Name', with: 'Megan'
        click_button 'Register'

        expect(page).to have_button('Register')
        expect(page).to have_content("email: [\"can't be blank\"]")
        expect(page).to have_content("password: [\"can't be blank\"]")
      end

      it 'I use a non-unique email' do
        user = User.create(name: 'Megan', email: 'megan@example.com', password: 'securepassword')

        visit register_path

        fill_in 'Name', with: user.name
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        fill_in 'Password confirmation', with: user.password
        click_button 'Register'

        expect(page).to have_button('Register')
        expect(page).to have_content("email: [\"has already been taken\"]")
      end
    end
  end
end
