require 'rails_helper'

RSpec.describe "As a registered user" do
  it "I can visit '/', login with my email and password" do
    visit '/'
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    click_button("Login")

    expect(current_path).to eq("/login")

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button("Login")
    expect(current_path).to eq("/dashboard")
  end
end
