require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Home page' do
  it "When a user visit's the root page, they see a welcome message" do

    visit "/"

    expect(page).to have_content("Let's")
    expect(page).to have_content("Make a")
    expect(page).to have_content("Party!")
  end

  it "has a description of the application" do

    description = "Explore movies and create a viewing party event for you and your friends to watch a movie together!"
    visit "/"
    expect(page).to have_content(description)
  end

  it "has a button for users to log in" do

    visit "/"

    expect(page).to have_button("Login")
  end

  it "has a button for users to register" do

    visit "/"

    expect(page).to have_button("Register")
  end

  it "does not display a login or register button once a user is logged in" do
    user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/login'

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_button("Login")

    visit '/'

    expect(page).to_not have_button('Register')
    expect(page).to_not have_button('Login')
    expect(page).to have_button('Logout')
  end
end
