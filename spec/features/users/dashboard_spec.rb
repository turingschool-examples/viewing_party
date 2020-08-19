require 'rails_helper'

RSpec.describe 'User dashboard page' do
  before :each do
    @neeru = User.create(name: "Neeru Ram", email: "neeru@turing.io", user_name: "movie_girl85")
    visit '/dashboard'
  end

  it "I see a welcome message" do
    expect(page).to have_content("Welcome (PLACEHOLDER)!")
  end

  it "I see a button to Discover Movies" do
    expect(page).to have_button("Discover Movies")

    click_on "Discover Movies"
    
    expect(current_path).to eq("/discover")
  end
end
