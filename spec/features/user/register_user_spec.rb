require 'rails_helper'

RSpec.describe 'User registration form' do
  it 'Takes you to a form to create a new user' do
    visit root_path
    click_link 'Register As A User'

    fill_in 'user[email]', with: 'alex@example.com'
    fill_in 'user[password]', with: 'strongpassword'
    fill_in 'user[password_confirmation]', with: 'strongpassword'
    click_button 'Register'

    expect(page).to have_content('Welcome alex@example.com!')
  end

  it "It keeps a user logged in after registering" do
    visit root_path
    click_link 'Register As A User'

    fill_in 'user[email]', with: "email@email.com"
    fill_in 'user[password]', with: "strongpassword"
    fill_in 'user[password_confirmation]', with: 'strongpassword'
    click_on "Register"

    visit '/profile'
    expect(page).to have_content("Hello, email@email.com!")
  end

  describe 'If passwords don not match' do
    it "redirects to new registration path" do
      visit root_path
      click_link 'Register As A User'

      fill_in 'user[email]', with: "email@email.com"
      fill_in 'user[password]', with: "strongpassword"
      fill_in 'user[password_confirmation]', with: 'strongpasswoord'
      click_on "Register"

      expect(page).to have_content("Password does not match. Please try again")
    end
  end
end
