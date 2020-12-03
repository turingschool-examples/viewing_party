require 'rails_helper'

describe 'movies_show' do
  describe 'as a logged in user' do
    before :each do
      @movie_service = MovieService.new(550)

      @user = User.create(
        email: 'testing@example.com',
        password: '1234**USAusa',
        password_confirmation: '1234**USAusa'
      )

      visit "/login"
      fill_in 'email', with: 'testing@example.com'
      fill_in 'password', with: '1234**USAusa'
      click_on "Login"
    end
    it "I see a button to 'create viewing party'" do
      visit "/movies/#{@movie_service.uuid}"
    end
    it "shows movie details" do
      visit "/movies/#{@movie_service.uuid}"
      expect(page).to have_content(@movie_service.title)
    end

    #   class MovieService
    #     def initialize(uuid)
    #       @id = uuid

    #       @title = data[:original]
    #     end

    #     def title
    #       @data.original_title
    #     end
    #   end

      #single movie endpoint (movie_data):
        #movie title: movie_data[:original_title]
        #vote average: movie_data[:vote_average]
        #run_time (display in hours mins): movie_data[:runtime]
        #assoc genres: movie_data[:genres]
        #summary description: movie_data[:overview]

      #credits endpoint - top 10 actors (cast_data):
        #cast_data[:cast].each do |actor|
          #actor_name: actor[:name]
          #actor_character: actor[:character]
        #end

      #reviews endpoint (review_data):
        #total reviews: review_data[:total_results]
        #review_data[:results].each do |review|
          #rating: review[:author_details][:rating]
          #author: review[:author]
          #contents: review[:content]
        #end

  end
end
