require 'rails_helper'

RSpec.describe 'user registration' do
  it 'has a welcome message' do
    visit new_user_path()
    expect(page).to have_content('Registration Page')
  end

  it "creates a new user" do
      visit new_user_path()
    fill_in 'name', with: "Dominic"
    fill_in 'email', with: "dominic@gmail.com"
    fill_in 'password', with: "secure"
    fill_in 'password_confirmation', with: "secure"
    click_button('Register')
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, Dominic")
  end

  it "errors out if fields are missing" do
    visit new_user_path()
  fill_in 'name', with: "Dominic"
  fill_in 'password', with: "secure"
  fill_in 'password_confirmation', with: "secure"
  click_button("Register")
  expect(page).to have_content("All fields required. Passwords must match")
  end

  it "errors out if passwords are different" do
    visit new_user_path()
    fill_in 'name', with: "Dominic"
    fill_in 'email', with: "dominic@gmail.com"
    fill_in 'password', with: "secure"
    fill_in 'password_confirmation', with: "dkajglkjakljg"
    click_button('Register')
    expect(page).to have_content("All fields required. Passwords must match")
  end

  it "errors out if it does not look like an email" do
    visit new_user_path()
    fill_in 'name', with: "Dominic"
    fill_in 'email', with: "dominic"
    fill_in 'password', with: "secure"
    fill_in 'password_confirmation', with: "secure"
    click_button('Register')
    expect(page).to have_content("All fields required. Passwords must match")
  end
end
