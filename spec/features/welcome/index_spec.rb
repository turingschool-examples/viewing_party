require 'rails_helper'

describe "when a user visits the welcome page" do
  it "includes a welcome message and brief decription" do
    visit root_path

    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_content("An app to view movies with your friends!")
  end

  it "has an email and password form to sign in" do
    visit root_path

    fill_in "user[email]", with: 'harrison@email.com'
    fill_in "user[password]", with: 'harrison'

    expect(page).to have_button('Sign In')
  end

  it "includes a link for a new user to sign up and redirects you to the registration page" do
    visit root_path

    expect(page).to have_link('New to Viewing Party? Register Here')

    click_link('New to Viewing Party? Register Here')
    expect(current_path).to eq('/registration')
  end
end
