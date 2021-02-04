require 'rails_helper'

describe "as a logged in user" do
	describe "when on the dashboard page" do

		before :each do
			@user = User.create(email: "ely@me.com", password: "password")
			allow_any_instance_of(Current).to receive(:user).and_return(@user)
		end

		describe 'in the friends section' do
			it 'says I have no friends when I have no friends' do

				 visit dashboard_path

				 expect(page).to have_content("You ain't got no friends.")
			end

			it 'I can see my friends' do
				@user2 = User.create(email: "friend@me.com", password: "password")
				@user3 = User.create(email: "otherfriend@me.com", password: "password")

				@user.add_friend(@user2)
				@user.add_friend(@user3)

				visit dashboard_path

				expect(page).to have_content("Friends")
				expect(page).to have_content(@user2.email)
				expect(page).to have_content(@user3.email)
				expect(page).not_to have_content("You ain't got no friends.")
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
