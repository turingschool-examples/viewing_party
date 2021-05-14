require 'rails_helper'

RSpec.describe "dashboard page" do
  before :each do
    @user = User.create!(email: "fav@email.com", username: "bestuser", password: "veryhardpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
  end

  it "includes a welcome message" do

    expect(page).to have_content("Welcome #{@user.username}!")
  end

  it "includes a button that takes us to the discover movies page" do

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')
    expect(current_path).to eq(discover_path)
  end

  describe "friends section" do
    it "includes a friends header and a field and button to search for friends" do

      expect(page).to have_content("Friends")
      expect(page).to have_field("email")
      expect(page).to have_button("Add Friend")
    end
  end
end
