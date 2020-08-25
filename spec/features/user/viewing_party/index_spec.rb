require "rails_helper"

RSpec.describe 'As an authenticated user' do
  before(:each) do
    stub_omniauth
    @user1 = User.create(name: "Bugs", email:"bugs_bunny@gmail.com")
    @user2 = User.create(name: "Lola", email:"lola_bunny@gmail.com")
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    fill_in('email', with: 'lola_bunny@gmail.com')
    click_on("Add Friend")
    fill_in('email', with: 'bugs_bunny@gmail.com')
    click_on("Add Friend")
  end

  describe "On a movies show page" do
    it "I see a link to create a new viewing party for this movie" do
      visit "/discover"
      click_button "Find Top Rated Movies"

      click_on("The Shawshank Redemption")

      expect(page).to have_button("Create Viewing Party for This Movie")

      click_on "Create Viewing Party for This Movie"

      expect(current_path).to eq(parties_path)
    end

    it "shows information to create a new viewing party" do
      visit "/discover"
      click_button "Find Top Rated Movies"

      click_on("The Shawshank Redemption")
      click_on "Create Viewing Party for This Movie"

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_field("Duration of party")
      expect(page).to have_content("When:")
      expect(page).to have_field("party_date")
      expect(page).to have_content("Time:")
      expect(page).to have_field("party_time")
      expect(page).to have_content("Add Friends")
      expect(page).to have_content("#{@user1.email}")
      expect(page).to have_content("#{@user2.email}")
      within(".friend-#{@user1.id}") do
        check("#{@user1.id}")
      end
      within(".friend-#{@user2.id}") do
        check("#{@user2.id}")
      end
      expect(page).to have_button("Create Party")
    end

    it "creates a viewing party" do
      visit "/discover"

      fill_in :find_movies, with: "Harry Potter"
      click_on "Find Movies"
      click_on 'Harry Potter and the Goblet of Fire'
      click_on "Create Viewing Party for This Movie"
      fill_in "party_date", with: "08/28/2020"
      fill_in "party_time", with: "08:00 PM"
      within(".friend-#{@user1.id}") do
        check("#{@user1.id}")
      end
      within(".friend-#{@user2.id}") do
        check("#{@user2.id}")
      end
      click_button("Create Party")
      expect(current_path).to eq('/dashboard')
      within('.viewing_parties') do
        expect(page).to have_content('Movie Title: Harry Potter and the Goblet of Fire')
        expect(page).to have_content('Party Date: 08/28/2020')
        expect(page).to have_content('Party Time: 08:00 PM')
      end
    end
  end
end
