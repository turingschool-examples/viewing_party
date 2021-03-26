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

    click_button "Register"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome, #{email}!")
  end

  it 'creates sad user' do
    user = User.create!(email: "joeb@email.com", password: "123" )
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    email = "joeb@email.com"
    password = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: ''

    click_button "Register"

    expect(current_path).to eq(new_user_path)

    expect(page).to have_content("Password can't be blank, Email has already been taken, and Password confirmation doesn't match Password")

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: 'fdafdsa'

    click_button "Register"

    expect(page).to have_content("Password confirmation doesn't match Password and Email has already been taken")
  end

  it "keeps a user logged in after registering" do
    visit root_path

    click_on "Register"

    email = "joeb@email.com"
    password = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Register"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Hello, #{email}!")
  end
end
