require 'rails_helper'

RSpec.describe 'New Viewing Party Page' do
  describe 'As a Visitor' do
      before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      @friend_1 = @user.friends.create!(email: "Todd@example.com", password: "password")
      @friend_2 = @user.friends.create!(email: "Carson@example.com", password: "password")
      @friend_3 = @user.friends.create!(email: "Charlie@example.com", password: "password")

      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    it 'I can click a button to go to create a new viewing party', :vcr do
      visit discover_index_path

      fill_in "Search by movie title", with: "The Godfather: Part II"
      click_button("Find Movies")
      click_on("The Godfather: Part II")
      expect(current_path).to eq("/movies/240")

      click_on "Create Viewing Party for Movie"
      expect(current_path).to eq(new_viewing_party_path)
    end

    it 'I can fill out a form to create a new viewing party' do
      visit "/movies/240"

      expect(page).to have_content("The Godfather: Part II")
      click_on "Create Viewing Party for Movie"

      expect(page).to have_content("The Godfather: Part II")
      expect(page).to have_content("202")
      save_and_open_page 
      fill_in :duration, with: "230"
      fill_in "Day", with: "12/20/20"
      fill_in "Start Time", with: "1:00"

      check("Todd@example.com")
      check("Carson@example.com")

      click_on 'Create Party'
      expect(current_path).to eq(dashboard_path)

      within ".viewing_parties" do
        expect(page).to have_content("The Godfather: Part II")
        expect(page).to have_content("12/20/20")
        expect(page).to have_content("1:00")
        expect(page).to have_content("Hosting")
      end
    end
  end
end
