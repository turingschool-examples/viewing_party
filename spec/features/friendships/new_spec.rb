require "rails_helper"

RSpec.describe "User Friendships" do
  before :each do
    @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @user2 = User.create!(username: "Francis", email: "coppola@wine.com")
    @user3 = User.create!(username: "Martin", email: "scorsese@hotmail.com")
  end
  it "can be created by searching for email" do
    visit '/dashboard'
    expect(page).to have_content("You currently have no friends")

    fill_in :email, with: @user2.email
    click_on "Add Friend"

    expect(current_path).to eq('/dashboard')

    expect(page).to_not have_content("You currently have no friends")
    expect(page).to have_content("You are now friends with #{@user2.username}")
    within(".friend-list") do
      expect(page).to have_content(@user2.username)
    end
  end
  it "can't add non-existent users" do
    visit '/dashboard'
    expect(page).to have_content("You currently have no friends")

    fill_in :email, with: "fake@email.com"
    click_on "Add Friend"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("You currently have no friends")
    expect(page).to have_content("User not found")
  end
  it "can have many friends" do
    visit '/dashboard'
    expect(page).to have_content("You currently have no friends")

    fill_in :email, with: @user2.email
    click_on "Add Friend"

    expect(current_path).to eq('/dashboard')

    fill_in :email, with: @user3.email
    click_on "Add Friend"

    expect(page).to_not have_content("You currently have no friends")
    expect(page).to have_content("You are now friends with #{@user3.username}")
    within(".friend-list") do
      expect(page).to have_content(@user2.username)
      expect(page).to have_content(@user3.username)
    end
  end
end
