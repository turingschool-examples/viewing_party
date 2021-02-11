require "rails_helper"

describe "Movie show page", :vcr do
  describe "displays" do
    it "shows all the details of a movie" do
      visit movie_path(447404)
    end
  end
end
