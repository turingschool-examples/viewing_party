require 'rails_helper'
require 'spec_helper'

RSpec.describe 'User registration page' do
  it "has a form to register a user that includes their email, password, password confirmation, and a register button" do

    visit "/"
    expect(page).to have_button("Register")
    click_button("Register")
    expect(current_path).to eq('/registration')

    fill_in :username, with: 'Username'
    fill_in :email, with: 'test123@gmail.com'
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    
    click_button("Register New User")

    expect(current_path).to eq('/dashboard')
  end

end
