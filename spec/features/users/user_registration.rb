require 'rails_helper'

RSpec.describe "User registration form" do
  it "creates new user if passwords match" do
    visit root_path

    click_on "Click here to register!"

    expect(current_path).to eq(new_user_path)

    email = "mOVielOvEr@example.com"
    password = "Test"

    test_email = email.downcase

    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirm]", with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{test_email}!")
  end

  it "does not create a new user if passwords DO NOT match" do
    visit root_path

    click_on "Click here to register!"

    expect(current_path).to eq(new_user_path)

    email = "mOVielOvEr@example.com"
    password = "test"

    test_email = email.downcase

    fill_in "user[email]", with: email
    fill_in "user[password]", with: password
    fill_in "user[password_confirm]", with: "wrong password"

    click_on "Create User"
save_and_open_page
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Passwords do not match, please try again.")
  end
end