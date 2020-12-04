require 'rails_helper'

RSpec.describe 'Movie Search Feature' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    describe 'User can search for movies' do
      it 'I submit valid movie title' do
        visit discover_index_path
        fill_in "Search by movie title", with: "Gabriel's Inferno Part III"
        click_button("Find Movies")

        expect(current_path).to eq(search_index_path)
        expect(page).to have_content("Gabriel's Inferno Part III")
      end
    end
  end
end
