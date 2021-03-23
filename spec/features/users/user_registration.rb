require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_on "Click here to register!"

    expect(current_path).to eq(new_user_path)

    email = "mOVielOvEr@example.com"
    password = "test"

    test_email = email.downcase

    fill_in "user[email]", with: email
    fill_in "user[password]", with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{test_email}!")
  end
end