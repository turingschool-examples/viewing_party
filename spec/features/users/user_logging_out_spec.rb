require 'rails_helper'

RSpec.describe "Logging In" do
  it "can log in with valid credentials" do
    user = User.create(email: "mOVIElover@example.com", password: "test")

    visit root_path

    expect(page).not_to have_content("Log out")

    click_on "Log In!"

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.email}")
    expect(page).to have_content("Log out")

    click_on "Log out"

    expect(current_path).to eq(root_path)

    expect(page).not_to have_content("Log out")
  end
end
