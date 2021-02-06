require 'rails_helper'

describe "as a logged in user" do
  describe "when I visit the discover page" do
    before :each do
			@user = User.create(email: "ely@me.com", password: "password")
			allow_any_instance_of(Current).to receive(:user).and_return(@user)
		end

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
      expect(page).to have_content("Gabriel's inferno part ii")
      expect(page).to have_content("Wolfwalkers")
      expect(page).to have_content("Dilwale dulhania le jayenge")
      expect(page).to have_content("Gabriel's inferno")
      expect(page).to have_content("The shawshank redemption")
      expect(page).to have_content("The godfather")
      expect(page).to have_content("Schindler's list")
      expect(page).to have_content("Your name.")
      expect(page).to have_content("Miraculous world: new york, united heroez")
      expect(page).to have_content("The godfather: part ii")

      # expect("Gabriel's inferno part iii").to appear_before("Gabriel's inferno part ii")
      # expect("Gabriel's inferno part ii").to appear_before("Wolfwalkers")
      # expect("Wolfwalkers").to appear_before("Dilwale dulhania le jayenge")
      # expect("Dilwale dulhania le jayenge").to appear_before("Gabriel's inferno")
      # expect("Gabriel's inferno").to appear_before("The shawshank redemption")
      # expect("The shawshank redemption").to appear_before("The godfather")
      # expect("The godfather").to appear_before("Schindler's list")
      # expect("Schindler's list").to appear_before("Your name.")
      # expect("Your name.").to appear_before("Miraculous world: new york, united heroez")
      # expect("Miraculous world: new york, united heroez").to appear_before("The godfather: part ii")
    end
  end
end