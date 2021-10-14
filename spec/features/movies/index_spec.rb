require 'rails_helper'

RSpec.describe 'Movies Index Page' do
  before :each do
    @user = User.create!(email: "test123@xyz.com", password: "banana", first_name: "James", last_name: "Doe")

    visit movies_path
  end

  describe 'show movie results' do
    it 'displays all the search functions' do

      expect(page).to have_content("Welcome #{@user.first_name}!")
      expect(page).to have_button('Find Top rated Movies')
      expect(page).to have_field('Search by movie title')
      expect(page).to have_button('Find Movies')
    end

    it 'displays the movie results' do
    end
  end
end
