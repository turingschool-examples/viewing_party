require 'rails_helper'

RSpec.describe 'Welcome' do

  it "displays a welcome message" do
    visit root_path()
    expect(page).to have_content("This is Viewing Party!")
  end

  it "displays description of the application" do
    visit root_path()
    expect(page).to have_content("This app allows you to add friends and have events to view movies!")
  end

  it "has a button to log in" do
    visit root_path()
    expect(page).to have_link("Log In")
    click_link("Log In")
    expect(current_path).to eq("/login")
  end

  it "has a button to register as a user" do
    visit root_path()
    expect(page).to have_button("Register")
    click_button("Register")
    expect(current_path).to eq("/registration")
  end
end
