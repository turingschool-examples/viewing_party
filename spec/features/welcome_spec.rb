require 'rails_helper'

describe 'Application Welcome Page' do
  it 'Welcomes user with options' do
    visit root_path

    expect(page).to have_content("Welcome to the Viewing Party!")
    expect(page).to have_content("Here at viewing party we aim to give you an online movie experience so good you'll forget you can't go to the theater anymore!")

    expect(page).to have_button("Log In")
    expect(page).to have_link("Want to sign up?")
  end
end