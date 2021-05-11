require 'rails_helper'

RSpec.describe "welcome index page" do
  before :each do
  visit root_path
  end

  it "includes a welcome message and a brief description" do
    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_content("Invite and join to view movies with friends")
  end

  it "has form to log in" do
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button("Log In")
  end

  it "has a link to registration" do
    expect(page).to have_link("New to Viewing Party? Register Here")
    click_link "New to Viewing Party? Register Here"

    expect(current_path).to eq(new_registration_path)
  end
end
