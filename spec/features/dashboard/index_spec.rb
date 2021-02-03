require 'rails_helper'

describe "as a logged in user" do
	describe "when on the dashboard page" do
		it 'I can see my friends' do
			@user = User.create(email: "ely@me.com", password: "password")
			@user2 = User.create(email: "friend@me.com", password: "password")
			@user3 = User.create(email: "otherfriend@me.com", password: "password")

			@user.add_friend(@user2)
			@user.add_friend(@user3)

			allow_any_instance_of(Current).to receive(:user).and_return(@user)

			visit dashboard_path

			expect(page).to have_content("Friends")
			expect(page).to have_content(@user2.email)
			expect(page).to have_content(@user3.email)
		end
	end
end


