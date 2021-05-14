require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
  before :each do
    user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
    login(user)
  end

  describe 'Top 40 movies' do
    it "Displays the top 40 highest rated movies" do
      visit movies_path

      expect(page).to have_content("Top 40 Movies")

      expect(page).to have_content(Movie.top_40)
    end
  end
end 
