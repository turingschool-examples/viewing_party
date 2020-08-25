require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe  "Viewing parties new page" do
    before(:each) do

      @info = {
        id: 393,
        title: "Kill Bill: Vol. 2",
        overview: "One of the best Tarantino films ever!",
        vote_average: 10,
        runtime: 136,
        genres: [{name: "Action"}, {name: "Suspense"}, {name: "Revenge"}]
      }

      @reviews = [{author: "Josh T", content: "This is a super fun film!"}, {author: "Phillip S", content: "Fun for the whole family!"}]

      @cast = [
        {
          name: "Uma Thurman",
          character: "Beatrix \'The Bride\' Kiddo"
        },
        {
          name: "Lucy Liu",
          character: "O-Ren Ishii"
        },
        {
          name: "David Carradine",
          character: "Bill"
        }
      ]

      @movie = Movie.new(@info, @cast)
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      @user2 = User.create!(username: "Francis", email: "coppola@wine.com")
      @user3 = User.create!(username: "Martin", email: "scorsese@hotmail.com")
    end
    it "has a form to create a new viewing party" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      allow_any_instance_of(MoviesService).to receive(:film_info).and_return(@info)
      allow_any_instance_of(MoviesService).to receive(:cast).and_return(@cast)
      allow_any_instance_of(MoviesService).to receive(:movie_reviews).and_return(@reviews)

      visit "/movies/#{@movie.id}"

      click_on "Create Viewing Party for #{@movie.title}"

      expect(current_path).to eq('/dashboard/viewing_parties/new')
      expect(page).to have_content("Movie Title: #{@movie.title}")
      expect(page).to have_content("Duration of party:")

    end
  end

end
