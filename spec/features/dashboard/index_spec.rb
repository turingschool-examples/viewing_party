require 'rails_helper'

RSpec.describe "Dashboard Index Page" do
  describe "As an authenticated user" do
    describe "when I visit my dashboard index page" do
      it "it displays my email" do
        user = User.create(password: "hello", email: "sample@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Log In"
        visit '/dashboard'
          save_and_open_page
          within "#userInfo" do
            expect(page).to have_content("Welcome #{user.email}!")
          end
      end
    end
  end
end