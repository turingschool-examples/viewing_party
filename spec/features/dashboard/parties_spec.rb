require "rails_helper"

describe "user dashboard" do
  before do
    @user = User.create(email: "me@example.com",password: "password123", password_confirmation: "password123")
    @friend = User.create(email: "MyFriend@example.com",password: "password123", password_confirmation: "password123")

    @my_party = Party.create( # hard coding doesn't matter here because the api is never being accessed.
      movie_id: 606244,
      movie_title: "The greatest movie ever",
      user_id: @user.id,
      scheduled_date: Date.today,
      start_time: Time.now,
      duration: 50
    )

    @my_friends_party = Party.create( # hard coding doesn't matter here because the api is never being accessed.
      movie_id: 606245,
      movie_title: "The second greatest movie ever",
      user_id: @friend.id,
      scheduled_date: Date.today,
      start_time: Time.now,
      duration: 50
    )

    UserParty.create(party: @my_friends_party, user: @user)

    allow_any_instance_of(DashboardController).to receive(:current_user).and_return(@user) #stubbing method to simulate being logged in.

    visit(dashboard_path)
  end

  it "has a section for parties containing the parties the user is hosting and invited to" do
    within("#parties") do
      within("#party-#{@my_party.id}") do
        expect(page).to have_content(@my_party.movie_title)
        expect(page).to have_content("Hosting")
      end

      within("#party-#{@my_friends_party.id}") do
        expect(page).to have_content(@my_friends_party.movie_title)
        expect(page).to have_content("Invited")
      end
    end
  end
end
