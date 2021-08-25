require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "New? Register here"

    expect(current_path).to eq(new_user_path)
    
    username = "funbucket13"
    password = "test"

    fill_in :email, with: username
    fill_in :password, with: password

    click_on "Register"

    expect(page).to have_content("Welcome, #{username}!")
  end
end