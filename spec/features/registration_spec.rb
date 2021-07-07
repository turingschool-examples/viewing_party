require 'rails_helper'

RSpec.describe "User registration form" do
  it "can create new user" do
    visit registration_path 
    expect(current_path).to eq(registration_path) 
    
    email = "hi@here.com"
    password = "hello"
    password_confirmation = "hello"
 
    fill_in 'user[email]', with: email 
    fill_in 'user[password]', with: password 
    fill_in 'user[password_confirmation]', with: password_confirmation

    click_on "Register User"

    # We don't have a dashboard yet
    # expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{email}!")
  end

  xit 'returns error message when you fail to register' do
    click_on "Register User"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Unable to Register")
  end
end