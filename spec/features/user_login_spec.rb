require 'rails_helper'

RSpec.describe "User login functionality" do
  before :each do
  visit root_path
  end

  it 'as a registered user with correct credentials I can log in' do

    user1 = User.create(email: "test2@test.com",
                        username: "anything",
                        password: "r9gutsdsad"
    )

    fill_in "email", with: user1.email
    fill_in "password", with: user1.password

    click_button "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome #{user1.username}!")

    save_
  end

  it 'as a registered user with incorrect credentials I cannot log in' do

    user1 = User.create(email: "test2@test.com",
                        username: "anything",
                        password: "r9gutsdsad"
    )

    fill_in "email", with: user1.email
    fill_in "password", with: "random_password"

    click_button "Log In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Incorrect log in information")
  end
end
