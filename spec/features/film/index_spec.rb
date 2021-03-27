require 'rails_helper'

RSpec.describe "Discover Movies" do
  it "has field and button to search for movies" do
    user = User.create(email: "mOVIElover@example.com", password: "test")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"
    visit discover_path
    expect(page).to have_field("Find Movies by Movie Title")
    expect(page).to have_button("Find Movies")
  end
  it "has field and button to search for movies, and searches/displays movies when clicked" do
    user = User.create(email: "mOVIElover@example.com", password: "test")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"
    visit discover_path
    fill_in :search, with: "jack reacher"
    # require "pry"; binding.pry
    click_button "Find Movies"
    expect(current_path).to eq(movies_path)
    expect("Jack Reacher").to appear_before("Jack Reacher: Never Go Back")
  end
end
