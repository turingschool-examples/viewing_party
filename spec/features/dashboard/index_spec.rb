require 'rails_helper'

RSpec.describe "discover page" do
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
  end

  describe "friends section" do
    it "includes a friends header and a field and button to search for friends" do
      expect(page).to have_content("Friends")
    end
  end
end
