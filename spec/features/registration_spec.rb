require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    # visit root_path 

    # click_on "Register Here!"
    # expect(current_path).to eq('/registration')
    visit registration_path 
    
    email = "hi@here.com"
    password = "hello"
    password_confirmation = "hello"

    fill_in :user_email, with: email 
    fill_in :user_password, with: password 
    fill_in :user_password_confirmation, with: password_confirmation

    click_on "Register User"

    expect(page).to have_content("Welcome, #{email}!")
  end
end