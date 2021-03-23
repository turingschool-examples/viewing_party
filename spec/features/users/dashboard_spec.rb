require 'rails_helper'

RSpec.describe "Dashboard" do
  before :each do
    @user = User.create!(name: "name", email: "email@gmail.com", password: "password")
    visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button("Log In")
      end
  end

  describe "when I visit a user dashboard it" do
    it "has a welcome header" do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{@user.name}!")
    end

    it "has a button to discover movies" do
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it "has a friends section" do
      within "#friends-#{@user.id}" do
        expect(page).to have_content("Friends")
        expect(page).to have_content("You have no one on your friends list yet")
        expect(page).to have_field(:email)
        expect(page).to have_button("Add Friend")
      end
    end

    it "has a viewing party section" do
      within "#viewing_party#{@user.id}" do
        expect(page).to have_content("Viewing Parties")
      end
    end
  end

  it "you can add friends to the friends section" do
    user2 = User.create!(name: "Jeremiah", email: "jeremiah@gmail.com", password: "password")
    user3 = User.create!(name: "Jeremiahhh", email: "jeremiah2@gmail.com", password: "password")
    user4 = User.create!(name: "Jeremiahh", email: "jeremiah3@gmail.com", password: "password")
    within "#friends-#{@user.id}" do
      fill_in :email, with: user2.email
      click_button("Add Friend")
      expect(current_path).to eq(dashboard_path())
      expect(page).to have_content(user2.name)
    end
  end

  it "holds multiple friends when added" do
    user2 = User.create!(name: "Jeremiah", email: "jeremiah@gmail.com", password: "password")
    user3 = User.create!(name: "Jeremiahhh", email: "jeremiah2@gmail.com", password: "password")
    user4 = User.create!(name: "Jeremiahh", email: "jeremiah3@gmail.com", password: "password")
    friend1 = Friend.create!(user_id:@user.id, friend_id: user2.id)
    within "#friends-#{@user.id}" do
      fill_in :email, with: user3.email
      click_button("Add Friend")
      expect(current_path).to eq(dashboard_path())
      expect(page).to have_content(user2.name)
      expect(page).to have_content(user3.name)
    end
  end

  it "returns a sad path if the email does not exist" do
    user2 = User.create!(name: "Jeremiah", email: "jeremiah@gmail.com", password: "password")
    user3 = User.create!(name: "Jeremiahhh", email: "jeremiah2@gmail.com", password: "password")
    user4 = User.create!(name: "Jeremiahh", email: "jeremiah3@gmail.com", password: "password")
    friend1 = Friend.create!(user_id:@user.id, friend_id: user2.id)
    within "#friends-#{@user.id}" do
        fill_in :email, with: 'Dominic@gmail.com'
        click_button("Add Friend")
        expect(current_path).to eq(dashboard_path())
    end
    expect(page).to have_content("That User Does Not Exist")
  end
end
