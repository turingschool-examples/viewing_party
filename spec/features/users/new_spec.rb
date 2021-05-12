require 'rails_helper'

RSpec.describe "users new page" do
  before :each do
  visit registration_path
  end

  it 'shows a form to register and creates and saves a user to the database' do
    fill_in "user[email]", with: "test@test.com"
    fill_in "user[username]", with: "TopMovieFan"
    fill_in "user[password]", with: "testpassword"

    click_button "Register Button"

    expect(current_path).to eq(dashboard_path)
    new_user = User.last

    expect(page).to have_content("Welcome TopMovieFan!")
    expect(new_user.email).to eq('test@test.com')
    expect(new_user.username).to eq('TopMovieFan')
  end
end
