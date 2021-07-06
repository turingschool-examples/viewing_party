# When a user visits the root path they should be on the welcome page which includes:

#  Button to Log in
#  Link to Registration
# Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt.

require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    visit root_path
  end

  it 'shows a welcome message' do
    expect(page).to have_content("Welcome to Viewing Party!")
  end

  it 'has a brief description of the application' do
    expect(page).to have_content("Browsing movies, create viewing partys, and invite friends!!!")
  end

  xit 'has a button to login' do
    click_button 'Log in here'
    expect(current_path).to eq('/log_in')
  end
end