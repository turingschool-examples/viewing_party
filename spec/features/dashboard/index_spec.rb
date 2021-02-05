require 'rails_helper'

describe "as a logged in user" do
	describe "when on the dashboard page" do

		before :each do
			@user = User.create(email: "ely@me.com", password: "password")

			visit root_path
			click_on "Sign In"

			fill_in :email, with: @user.email
			fill_in :password, with: @user.password
			click_button "Log In"
		end

		describe 'in the friends section' do
			it 'says I have no friends when I have no friends' do

				 expect(page).to have_content("You ain't got no friends.")
			end

			it 'I can see my friends' do
				@user2 = @user.friends.create(email: "friend@me.com", password: "password")
			  @user3 = @user.friends.create(email: "otherfriend@me.com", password: "password")

				expect(page).to have_content("Friends")
				expect(page).to have_content(@user2.email)
				expect(page).to have_content(@user3.email)
				expect(page).not_to have_content("You ain't got no friends.")
			end

			it 'tells me when a friend does not exist' do

				fill_in :email, with: "robert.bh@123.com"
				click_button 'Add Friend'

				expect(page).not_to have_content("robert.bh@123.com")
				expect(page).to have_content("Friend not found.")
			end

			it 'does not allow me to add a friend I already have' do
				@user2 = User.create(email: "friend@me.com", password: "password")

				fill_in :email, with: "friend@me.com"
				click_button 'Add Friend'

				fill_in :email, with: "friend@me.com"
				click_button 'Add Friend'

				expect(page).to have_content("You're already friends.")
			end
		end

		it 'I can click the discover movies link' do
			visit dashboard_path

			expect(page).to have_link("Discover Movies")

			click_link "Discover Movies"
			expect(current_path).to eq(discover_path)
		end
	end
end
