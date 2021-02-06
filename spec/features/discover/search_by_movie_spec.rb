require 'rails_helper'

describe "as a logged in user" do
  describe "when I visit the discover page" do
    before :each do
			@user = User.create(email: "ely@me.com", password: "password")
			allow_any_instance_of(Current).to receive(:user).and_return(@user)
		end

    it 'I can search for mvies by title', :vcr do
      # json_response = File.open("./spec/fixtures/pulp_fiction_movie_search_query.json")
      # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=f54bbd3f0b8d80da437d651c3c2f00b1&page=1&query=Pulp%20Fiction").
      #    with(
      #     headers: {
      #  	  'Accept'=>'*/*',
      #  	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #  	  'User-Agent'=>'Faraday v1.0.1'
      #      }).
      #    to_return(status: 200, body: json_response)

      visit discover_path

      fill_in :movie_name, with: "Pulp Fiction"
      click_button "Search Movies"

      expect(current_path).to eq(movies_path)
      
      expect(page).to have_content("Total Results: 6")

      expect(page).to have_content("Pulp fiction")
      expect(page).to have_content("Pulp fiction: the facts")
      expect(page).to have_content("Pulp fiction art")
      expect(page).to have_content("Pulp fiction: the golden age of storytelling")
      expect(page).to have_content("fotv presents: pulp fiction: the golden age of storytelling")
    end
  end
end