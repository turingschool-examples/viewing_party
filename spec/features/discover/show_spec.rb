require 'rails_helper'

describe "Movie Detail (Show) Page" do
  before :each do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit movie_detail_path
  end

  describe "As an authenticated user, when I visit the movie's detail page" do
    it "has a button to create a viewing party that takes the user to the new party page" do 
      expect(current_path).to eq(movie_detail_path)
      expect(page).to have_button("Create a New Viewing Party")
      
      click_button "Create a New Viewing Party"
      expect(current_path).to eq(new_party_path)
      
    end
  end

#And I should see the following information about the movie:
# Movie Title
# Vote Average of the movie
# Runtime in hours & minutes
# Genere(s) associated to movie
# Summary description
# List the first 10 cast members (characters&actress/actors)
# Count of total reviews
# Each review's author and information
# Details: This information should come from 3 different endpoints from The Movie DB API
end
