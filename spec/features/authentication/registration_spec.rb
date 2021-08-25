require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "New? Register here"

    expect(current_path).to eq(new_user_path)
    
    username = "funbucket13"
    password = "test"
    password_confirmation = "test"

    fill_in :email, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Register"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it "doesn't create new user if password and confirmation don't match" do
    visit new_user_path
    
    username = "funbucket13"
    password = "test"
    password_confirmation = "tes"

    fill_in :email, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation

    click_on "Register"
    expect(page).to have_content("Password and confirmation must match!")
    expect(current_path).to eq(new_user_path)
  end
end