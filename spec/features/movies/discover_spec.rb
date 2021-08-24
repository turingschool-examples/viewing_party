require 'rails_helper'
 RSpec.describe 'can find certain movies based off of criteria' do
   before :each do
     
    visit "/discover"
   end

   it 'search for a movie through the movie search bar' do
    expect(page).to have_field(:search)
    
   end
   xit 'can click the link to go to top rated movies' do
    expect(page).to have_link("Find Top Rated Movies")

    click_link("Find Top Rated Movies")
    
    expect(current_path).to eq('/movies')
   end
 end