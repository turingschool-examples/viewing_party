require 'rails_helper'

describe "Welcome Page:" do
  it 'it has a welcome message and description' do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Description")
  end

  it 'it has a link to register a new user' do
    visit '/'

    expect(page).to have_link("New to Viewing Party? Register Here.")
  end

  it "A user can log in" do
    visit '/'

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Login')
  end
end
