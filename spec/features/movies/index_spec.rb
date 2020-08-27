require 'rails_helper'

RSpec.describe "As a registered user" do
  before :each do
    @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can see top 40 movies index", :vcr do
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

  it "can show a list of movies related to a keyword search" do
    json_response = File.read('./spec/fixtures/movies_search.json')
    json_response2 = File.read('./spec/fixtures/movies_search2.json')
	  stub_request(:get, "https://api.themoviedb.org/3/search/movie/?#{ENV['MOVIES_API_KEY']}&page=1&query=Superman").to_return(status: 200, body: json_response)
	  stub_request(:get, "https://api.themoviedb.org/3/search/movie/?#{ENV['MOVIES_API_KEY']}&page=2&query=Superman").to_return(status: 200, body: json_response2)

    visit '/dashboard/discover'
    keyword = "Superman"
    fill_in :keyword, with: keyword
    click_on "Find Movies"

    expect(current_path).to eq('/movies')
    expect(page).to have_content("Films related to #{keyword}")
  end
end
