require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    # commented out because I don't have a welcome page
    # visit root_path 

    # click_on "Register Here!"
    # expect(current_path).to eq('/registration')
    visit registration_path 
   
    email = "hi@here.com"
    password = "hello"
    password_confirmation = "hello"
 
    fill_in 'user[email]', with: email 
    fill_in 'user[password]', with: password 
    fill_in 'user[password_confirmation]', with: password_confirmation

    click_on "Register User"

    expect(page).to have_content("Welcome, #{email}!")
  end
end