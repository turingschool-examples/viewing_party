require 'rails_helper'

describe "As a visitor" do
  describe "I visit the welcome page and see a link to register" do
    it "I click the link, fill in details, and click register" do
      visit '/'
      click_link("New to Viewing Party? Register Here.")

      expect(current_path).to eq('/registration')

      fill_in "user[username]", with: "JohnDoe"
      fill_in "user[email]", with: "john@doe.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on 'Create User'
      user = User.last
      expect(current_path).to eq("/#{user.username}/dashboard")
      expect(page).to have_content('😃 Welcome JohnDoe!')
    end
  end

  describe "When I try to register with an email or username that already exists" do
    it "I am given a message and returned to the registration form" do
      user = User.create!(
        username: "JonathonDoe",
        email: "jonathon@doe.com",
        password: "1234"
      )
      visit '/'
      click_link("New to Viewing Party? Register Here.")

      expect(current_path).to eq('/registration')

      fill_in "user[username]", with: user.username
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      fill_in "user[password_confirmation]", with: user.password
      click_on 'Create User'
      expect(page).to have_content('Username has already been taken and Email has already been taken')
    end
  end
end
