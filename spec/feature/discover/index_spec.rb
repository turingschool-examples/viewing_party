require 'rails_helper'

RSpec.describe 'movie discover page' do
  before(:each) do
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'as a user, after logging in and clicking on discover movies, I am redirected to a discover page' do

    visit '/dashboard'

    within "#discover-movies" do
      click_button 'Discover Movies'
    end

    expect(current_path).to eq('/discover')
  end

  it 'When the user clicks on the top 40 button they should be taken to the movies page' do
    json1 = File.read('spec/fixtures/top_40_movies_1.json')
    json2 = File.read('spec/fixtures/top_40_movies_2.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1").to_return(status: 200, body: json1)
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2").to_return(status: 200, body: json2)
    visit '/discover'

    expect(page).to have_button("Discover Top 40 Movies")
    click_button 'Discover Top 40 Movies'
    expect(current_path). to eq('/movies')
  end
end
