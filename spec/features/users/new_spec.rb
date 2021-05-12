require 'rails_helper'

RSpec.describe "users new page" do
  before :each do
  visit registration_path
  end

  it 'shows a form to register and creates and saves a user to the database' do
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[username]", with: "TopMovieFan"
    fill_in "user[password]", with: "testpassword"
    fill_in "user[password_confirmation]", with: "testpassword"

    click_button "Register Button"

    expect(current_path).to eq(dashboard_path)
    new_user = User.last

    expect(page).to have_content("Welcome TopMovieFan!")
    expect(new_user.email).to eq('test@test.com')
    expect(new_user.username).to eq('TopMovieFan')
  end

  it 'new user not able to register with non matching passwords' do
    fill_in "user[email]", with: "test2@test.com"
    fill_in "user[username]", with: "Top2MovieFan"
    fill_in "user[password]", with: "testpassword"
    fill_in "user[password_confirmation]", with: "wrongpassword"

    click_button "Register Button"
    expect(page).to have_content("Password confirmation doesn't match Password")

    expect(current_path).to eq(registration_path)
    expect(User.find_by(username: "Top2MovieFan")).to eq(nil)
  end

  it 'new user not able to register with non unique email' do
    user1 = User.create(email: "test2@test.com",
                        username: "anything",
                        password: "r9gutsdsad"
    )

    fill_in "user[email]", with: "test2@test.com"
    fill_in "user[username]", with: "Top2MovieFan"
    fill_in "user[password]", with: "testpassword"
    fill_in "user[password_confirmation]", with: "testpassword"

    click_button "Register Button"
    expect(page).to have_content("Email has already been taken")

    expect(current_path).to eq(registration_path)
    expect(User.find_by(username: "Top2MovieFan")).to eq(nil)
  end

  it 'new user not able to register with an incorrect email format' do

    fill_in "user[email]", with: "testm"
    fill_in "user[username]", with: "Top2MovieFan"
    fill_in "user[password]", with: "testpassword"
    fill_in "user[password_confirmation]", with: "testpassword"

    click_button "Register Button"
    expect(page).to have_content("Email is invalid")

    expect(current_path).to eq(registration_path)
    expect(User.find_by(username: "Top2MovieFan")).to eq(nil)
  end
end
