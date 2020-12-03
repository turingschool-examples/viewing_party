require 'rails_helper'

describe 'As a user' do
  before :each do
    User.create(email: 'test@gmail.com', password: 'test', first_name: 'Alex', last_name: 'Rivero')

    visit  '/'
    fill_in :email,	with: "test@gmail.com"
    fill_in :password,	with: "test"
    click_button 'Sign In'
  end

  it 'when I visit /discover I expect to see 2 buttons and a text field' do
    visit '/discover'
    user = User.last
    expect(page).to have_content("Welcome #{user.first_name} #{user.last_name}")

    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end

  it "When I make an entry in the search bar, I see my results listed on the movies
      index page" do
    visit '/discover'
    user = User.last
    
    fill_in :movie_title,	with: "star"
    click_button 'Find Movies'
    expect(current_path).to eq('/movies')

    within all('.movie-results')[0] do
      expect(page).to have_content(/star/i)
    end

    within all('.movie-results')[39] do
      expect(page).to have_content(/star/i)
    end
  end
end
