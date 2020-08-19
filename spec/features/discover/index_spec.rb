require 'rails_helper'

RSpec.describe 'Discover Page' do
  before :each do
    @neeru = User.create(name: "Neeru Ram", email: "neeru@turing.io", user_name: "movie_girl85")
    visit '/discover'
  end

  it "I see a button to discover top-rated movies" do
    expect(page).to have_button('Find Top Rated Movies')
  end

  it "I see a text field to enter a keyword(s) to search by movie title" do
    find_button 'Find Movie'
  end
end
