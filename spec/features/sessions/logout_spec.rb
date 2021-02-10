require 'rails_helper'

describe "a user can logout" do
	it 'allows a user to log out' do
		@user = User.create(email: 'test@example.com', password: "password")

		visit login_path

		fill_in :email, with: "test@example.com"
		fill_in :password, with: "password"
		click_button "Log In"

		visit dashboard_path

		click_on "Logout"
		expect(page).to have_content('You have been successfully logged out')
		expect(current_path).to eq(root_path)
		expect(page).to have_content("Sign In")
	end
end
