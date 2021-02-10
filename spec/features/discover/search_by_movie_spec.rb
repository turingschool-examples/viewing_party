require 'rails_helper'

describe "as a logged in user" do
  describe "when I visit the discover page" do
    before :each do
			@user = User.create(email: "ely@me.com", password: "password")
			allow_any_instance_of(Current).to receive(:user).and_return(@user)
		end
    describe "happy paths" do
      it 'I can search for mvies by title', :vcr do
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
  
      it 'I can see top rated movies by vote average', :vcr do
  
        visit discover_path
  
        click_button "Top Rated Movies"
  
        expect(current_path).to eq(movies_path)
  
        expect(page).to have_content("Total Results: 40")

        expect(page).to have_content("Gabriel's inferno part iii")
        expect(page).to have_content("Vote Average: 9")

        expect(page).to have_content("Gabriel's inferno part ii")
        expect(page).to have_content("Vote Average: 8.8")

        expect(page).to have_content("Wolfwalkers")
        expect(page).to have_content("Vote Average: 8.7")
      end
    end

    describe "sad paths" do
      it 'When I search for a movie without a valid search entry, I am told to Please enter a movie title' do

        visit discover_path 

        click_button "Search Movies"

        expect(page).to have_content("Please enter a movie title")
      end
    end
  end
end