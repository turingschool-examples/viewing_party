require 'rails_helper'

RSpec.describe 'Movie Details', type: :feature do
  before :each do
    user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
    login(user)
  end

  describe 'single movie display' do
    it "As an authenticated user,
      When I visit the movies detail page,
      I should see:
      Button to create a viewing party
      Details This button should take the authenticated user to the new event page
      And I should see the following information about the movie:
        Movie Title
        Vote Average of the movie
        Runtime in hours & minutes
        Genre(s) associated to movie
        Summary description
        List the first 10 cast members (characters&actress/actors)
        Count of total reviews
        Each review's author and information" do
     visit "/movies/:id"
     expect(page).to have_button("Create Viewing Party For Movie")
    #  expect(page).to have_content(titanic.title)
    #  expect(page).to have_content(titanic.vote_average)
    #  expect(page).to have_content(titanic.runtime)
    #  expect(page).to have_content(titanic.genre)
    #  expect(page).to have_content(titanic.summary)
    #  expect(page).to have_content(titanic.cast_top_10)
    #  expect(page).to have_content(titanic.total_reviews)
    end
  end
end
