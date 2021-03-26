require 'rails_helper'

RSpec.describe 'viewing party' do
  it 'show page button brings us to new viewing party' do
    VCR.use_cassette('all_movie_info') do
      @user = User.create(name: "Bob", email: "joe@gmail.com", password: 'password1')
      visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button("Log In")
      end
      visit '/movies/550'
      within '#viewing_party' do
        click_button "Create Viewing Party for Movie"

        expect(current_path).to eq(new_party_path)
        sleep 1
        expect(page).to have_content("Fight Club")
      end
    end
  end
end
