require "rails_helper"

describe "Discover page" do
  describe "displays" do
    it "a button to discover top 40 movies" do
      visit discover path
      expect(page).to have_button("Find Popular Movies")
    end

    it " Find popular movies button links you to movie index and displays top movies" do
      VCR.use_cassette('testing_vcr_stuff') do
        visit discover_path
        click_button("Find Popular Movies")
        expect(current_path).to eq(movies_path)
      end
    end
  end
end
