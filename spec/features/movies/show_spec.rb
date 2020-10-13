require 'rails_helper'

RSpec.describe 'Movie Details page' do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "should have details for a movie", :vcr do
    visit top_movies_path

    within(first('.movie')) do
      click_link("Gabriel's Inferno Part II")
    end

    # expect(current_path).to eq(movies_show_path())
    expect(current_path).to_not eq(top_movies_path)

    expect(page).to have_button('Create Viewing Party for Movie')

    expect(page).to have_content("Gabriel's Inferno Part II")
    expect(page).to have_content('Vote Average: 8.9')
    expect(page).to have_content('Runtime: 1 hrs, 45 mins')
    expect(page).to have_content("Summary: Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?")
    expect(page).to have_content("Genres: Romance")
  end
end
