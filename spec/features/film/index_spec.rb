require 'rails_helper'

RSpec.describe "Discover Movies" do
  it "has field and button to search for movies" do
    user = User.create(email: "mOVIElover@example.com", password: "test")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"
    visit discover_path
    expect(page).to have_field("Find Movies by Movie Title")
    expect(page).to have_button("Find Movies")
  end
  it "has field and button to search for movies, and searches/displays movies when clicked" do
    user = User.create(email: "mOVIElover@example.com", password: "test")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"
    visit discover_path
    fill_in :search, with: "jack reacher"
    
    VCR.use_cassette('search_for_movie_title_index_page') do 
      click_button "Find Movies"
      expect(current_path).to eq(movies_path)
      expect("Jack Reacher").to appear_before("Jack Reacher: Never Go Back")
    end
  end
  it "has field and button to search for movies, and searches/displays movies when clicked" do
    user = User.create(email: "mOVIElover@example.com", password: "test")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on "Log In"
    visit discover_path
    fill_in :search, with: "the"
    VCR.use_cassette('search_for_movie_title_index_page_the') do 
      click_button "Find Movies"
      expect(current_path).to eq(movies_path)
      expect(MovieService.make_searched_movies("the").length).to eq(40)
    end
  end
end
