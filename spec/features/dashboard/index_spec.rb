require 'rails_helper'

RSpec.describe "Dashboard Index Page" do
  before :each do
    @user = User.create(password: "hello", email: "sample@email.com")
    visit root_path
    click_on "Log In!"
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Log In"
    @user_1 = User.create(password: "hello", email: "user_1_email@email.com")
    @user_2 = User.create(password: "hello", email: "sample_1@email.com")
    @party = @user_1.parties.create({movie_id: 550, time: Time.now, date: Date.today, duration: "150"})
    @guest_1 = @party.guest_lists.create({user_id: @user.id, party_id: @party.id})
    @guest_2 = @party.guest_lists.create({user_id: @user_2.id, party_id: @party.id})
    VCR.use_cassette('viewing_parties_you_are_invited_to') do
      visit dashboard_path
    end
  end
  describe "As an authenticated user when I visit my dashboard index page" do
    it "it shows links for logout" do
      expect(page).to have_link("Log Out")
    end
    it "it shows links for movie" do
      expect(page).to have_link("Movies")
    end
    it "it shows links for dashboard" do
      expect(page).to have_link("Dashboard")
    end
    it "it displays my email" do
        within "#userInfo" do
          expect(page).to have_content("Welcome #{@user.email}!")
        end
    end
  end
  it "I see a button to the discover movies page and clicking it takes me to discover movies" do
    within "#discover-movies-link" do
      expect(page).to have_link("Discover Movies")
      click_link("Discover Movies")
    end
    expect(current_path).to eq(discover_path)
  end
  it "has a section for friends that contains a text field to enter an email and hit button to add friend" do
    within "#friends" do
      expect(page).to have_field(:friend_email)
      expect(page).to have_button("Add Friend")
      expect(page).to have_content("You currently have no friends.")
    end
  end
  it "can add friends when a valid email is entered into the field and add friend button is clicked" do
    VCR.use_cassette('viewing_parties_you_are_invited_to_1') do
      within("#friends") do
        fill_in :friend_email, with: @user_1.email
        click_button("Add Friend")
      end
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(@user_1.email)
    end
  end
  it "When I enter an invalid email into the field and click add friend, a new friend is NOT added" do
    VCR.use_cassette('viewing_parties_you_are_invited_to_1') do
      within("#friends") do
        fill_in :friend_email, with: "ample_1@email.com"
        click_button("Add Friend")
      end
      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_content(@user_1.email)
      expect(page).to have_content("Incorrect email")
    end
  end
  it "When I enter a valid email into the field and click add friend, a new friend is added" do
    VCR.use_cassette('viewing_parties_you_are_invited_to_2') do
      within("#friends") do
        fill_in :friend_email, with: @user_1.email
        click_button("Add Friend")
      end
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content(@user_1.email)
      click_button("Unfollow")
      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_content(@user_1.email)
    end
  end
  it "When I am hosting a party I can see the party details" do
    VCR.use_cassette('viewing_parties_you_are_invited_to_3') do
      @party_1 = @user.parties.create({movie_id: 550, time: Time.now, date: Date.today, duration: "150"})
      visit dashboard_path
      within("#hosting") do
        expect(page).to have_content("Fight Club")
        expect(page).to have_content(@party_1.time.strftime("%I:%M %P"))
        expect(page).to have_content(@party_1.date.strftime("%B %d, %Y"))
        expect(page).to have_content("Hosting")
      end
    end
  end
  it "displays parties I am invited to" do
    VCR.use_cassette('viewing_parties_you_are_invited_to_4') do
      within("#invited") do
        expect(page).to have_content("Fight Club")
        expect(page).to have_content(@party.time.strftime("%I:%M %P"))
        expect(page).to have_content(@party.date.strftime("%B %d, %Y"))
        expect(page).to have_selector('b', text: "#{@user.email}")
        expect(page).to have_content(@user_2.email)
      end
    end
  end
end
