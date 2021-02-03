require 'rails_helper'

describe "As a visitor" do
	describe "When i visit the login path" do
		describe "happy path" do
			it 'I can sign in with valid credentials ' do
				@user = User.create(email: 'test@example.com', password: "password")

				visit root_path

				click_link "Sign In"

				expect(current_path).to eq(login_path)

				fill_in :email, with: "test@example.com"
				fill_in :password, with: "password"

				click_button "Log In"

				expect(current_path).to eq(root_path)
				expect(page).to have_content("Welcome #{@user.email}")
			end
		end
		describe "sad path" do
			it 'does not allow me to sign in with invalid credentials' do
				@user = User.create(email: 'test@example.com', password: "password")

				visit root_path

				click_link "Sign In"

				expect(current_path).to eq(login_path)

				fill_in :email, with: "test@example.com"
				fill_in :password, with: "wrongpassword"

				click_button "Log In"
				save_and_open_page
				expect(page).to have_content("Incorrect email or password.")
			end
		end
	end
end