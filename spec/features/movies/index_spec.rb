require 'rails_helper'

RSpec.describe "As a registered user" do
  before :each do
    @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  it "can see top 40 movies index" do
    visit '/dashboard'
    click_on 'Discover Movies!'
    expect(current_path).to eq('/dashboard/discover')
    click_on "Find Top Rated Movies"
    expect(current_path).to eq('/movies')
    expect(page).to have_css(".blockbusters")
    expect(page).to have_css(".title", count: 40)
    within(first(".movie")) do
      expect(page).to have_css(".title")
      title = find(".title").text
      expect(title).not_to be_empty
      expect(page).to have_css(".vote-average")
      vote_ave = find(".vote-average").text
      expect(vote_ave).not_to be_empty
    end
  end
end
