require 'rails_helper'

RSpec.describe 'Movies Page' do
  before :each do
    visit '/login'
    email = "example@example.com"
    password = "test"
    user = User.create!(email: email, password: password)

    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"
    click_button "Discover Movies"
  end

  describe 'When I visit the movies page' do
    it 'can see top 40 movies' do
      click_button "Top 40 Movies"
      results = top_40_movies
      expect(results.size).to eq(40)
      expect(page).to have_content(results)
    end
  end
end
