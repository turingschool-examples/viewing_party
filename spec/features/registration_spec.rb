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

    expect(current_path).to eq(welcome_path)
    expect(page).to have_content("Registration completed for #{email}. Please log in!")
  end

  it 'returns error message when you fail to register' do
    visit registration_path
    click_on "Register User"

    expect(current_path).to eq(registration_path)
    expect(page).to have_content("Passwords do not match")
  end
end
