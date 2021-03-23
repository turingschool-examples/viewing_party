require 'rails_helper'

RSpec.describe 'user registration' do
  it 'has a welcome message' do
    visit registration_path()
    expect(page).to have_content('Registration Page')
  end

  it "creates a new user" do
    user = User.create(name: "Dominic", email: "dominic@gmail.com", password:"secure")
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password 
  end
end
