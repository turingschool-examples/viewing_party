require "rails_helper"

describe "Movie show page", :vcr do
  describe "displays" do
    before :each do
      @jamie = User.create!(email: "jamie@email.org", password: "password1", password_confirmation: "password1")
      visit root_path

      fill_in "email", with: "jamie@email.org"
      fill_in "password", with: "password1"
      click_on "Log In"

      visit movie_path(447404)
    end

    it "shows the title of the movie" do
      expect(page).to have_content("Pokémon Detective Pikachu")
    end

    it "shows the vote average of the movie" do
      expect(page).to have_content("7.0")
    end

    it "shows the runtime of the movie in hours and minutes" do
      expect(page).to have_content("1:45")
    end
    it "shows the genres of the movie" do
      expect(page).to have_content("Action")
      expect(page).to have_content("Adventure")
      expect(page).to have_content("Fantasy")
    end

    it "shows a summary of the movie" do
      summary = "In a world where people collect pocket-size monsters (Pokémon) to do battle, a boy comes across an intelligent monster who seeks to be a detective."
      expect(page).to have_content(summary)
    end

    it "shows a list of 10 cast members in the movie and their role" do
      expect(page).to have_content("Ryan Reynolds as Detective Pikachu (voice)")
      expect(page).to have_content("Justice Smith as Tim Goodman")
      expect(page).to have_content("Kathryn Newton as Lucy Stevens")
      expect(page).to have_content("Bill Nighy as Howard Clifford")
      expect(page).to have_content("Ken Watanabe as Lieutenant Hide Yoshida")
      expect(page).to have_content("Chris Geere as Roger Clifford")
      expect(page).to have_content("Suki Waterhouse as Ms. Norman")
      expect(page).to have_content("Josette Simon as Grams")
      expect(page).to have_content("Alejandro De Mesa as Bartender")
      expect(page).to have_content("Rita Ora as Dr. Ann Laurent")
    end

    it "shows the review count of the movie" do
      expect(page).to have_content("Total Reviews: 4")
    end

    it "shows each reviews author and information" do
      expect(page).to have_content("Author: msbreviews")
      expect(page).to have_content("If you enjoy reading my Spoiler-Free reviews")
      expect(page).to have_content("Author: Gimly")
      expect(page).to have_content("The core story is just... So dumb.")
      expect(page).to have_content("Author: Yinse")
      expect(page).to have_content("The movie did not have the best story")
      expect(page).to have_content("Author: Sheldon Nylander")
      expect(page).to have_content("Having never played the")
    end

    it "has a button to create a new viewing party" do
      expect(page).to have_button("Create New Viewing Party")
     
      click_button("Create New Viewing Party")

      expect(current_path).to eq("/movies/447404/new_viewing_party")
    end
  end
end
