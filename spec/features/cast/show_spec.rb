require 'rails_helper'

RSpec.describe "Cast Show Page" do
  describe "as an authinticated user" do
    before :each do
      @user = User.create!(name: "Name", email: "email@domain.com", password: "password")
      visit root_path
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Log In"
    end

    describe "when I visit a movie show page" do
      it "next to each actor, it shows a button 'Other Movies'" do
        VCR.use_cassette('movie_show_page') do
          visit movie_path(550)

          within("#movie_cast") do
            expect(page).to have_button('Other movies with Brad Pitt')
          end
        end
      end
      it "next to each actor, it shows a button 'Other Movies'" do
        VCR.use_cassette('cast_redirect') do
          visit movie_path(550)

          within("#movie_cast") do
            click_button 'Other movies with Brad Pitt'
          end

          expect(current_path).to eq(cast_path(287))
        end
      end
    end

    describe "when I visit the cast show page" do
      it "shows that persons name" do
        VCR.use_cassette('brad_pit') do
          visit cast_path(287)

          expect(page).to have_content("Movies that Brad Pitt has stared in:")
        end
      end
      it "shows that persons name" do
        VCR.use_cassette('brad_pitt') do
          visit cast_path(287)

          expect(page).to have_content("Meet Joe Black")
          expect(page).to have_content("Fury")
          expect(page).to have_content("World War Z")
        end
      end
    end
  end
end
