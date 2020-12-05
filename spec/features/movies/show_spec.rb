require 'rails_helper'

RSpec.describe 'Movies Details Page' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")

      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

      it 'I see a button to create a viewing party', :vcr do
        visit discover_index_path

        fill_in "Search by movie title", with: "Gabriel's Inferno Part III"
        click_button("Find Movies")
        click_on("Gabriel's Inferno Part III")
        expect(current_path).to eq("/movies/761053")
        end
      end
    end
