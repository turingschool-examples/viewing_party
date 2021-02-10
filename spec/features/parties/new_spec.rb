require 'rails_helper'

describe "As a logged in user" do
	describe "When i visit the new parties path" do
		it 'I cannot make a party without a datetime', :vcr do
			@user = User.create(email: "ely@me.com", password: "password")
			@user2 = User.create(email: "friend@me.com", password: "password")

			Friendship.create(user_id: @user.id, friend_id: @user2.id)

			allow_any_instance_of(Current).to receive(:user).and_return(@user)

			visit movie_path(8587)

			click_button "Create Movie Party"

			expect(current_path).to eq(new_party_path)

			check "party[party_guests][]"

			click_button "Create Party"


			expect(page).to have_content("Datetime can't be blank")
		end

		it 'I cannot make a party without a guests', :vcr do
			@user = User.create(email: "ely@me.com", password: "password")

			allow_any_instance_of(Current).to receive(:user).and_return(@user)

			visit movie_path(8587)

			click_button "Create Movie Party"

			expect(current_path).to eq(dashboard_path)

			expect(page).to have_content("Add friends to create a viewing party")
		end
	end
end
