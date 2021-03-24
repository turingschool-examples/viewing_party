require 'rails_helper'

describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    email = "joeb@email.com"
    password = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Create User"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{email}!")
  end

  it 'creates sad user' do
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    email = "joeb@email.com"
    password = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: 'fdafdsa'

    click_on "Create User"

    expect(page).to have_content("Wrong email/password")
  end
end