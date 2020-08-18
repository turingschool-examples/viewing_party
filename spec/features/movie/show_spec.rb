require 'rails_helper'

RSpec.describe 'movie show page' do

  it 'has a create button' do
    movie =     {
      "id": 164558,
      "original_title": "One Direction: This Is Us",
      "original_language": "en",
      "title": "One Direction: This Is Us",
      "popularity": 1.166982,
      "vote_count": 55,
      "video": false,
      "vote_average": 8.45
    }

    visit "/movies/#{movie[:id]}"

    expect(page).to  have_button('Add Viewing Party for Movie')

    click_on 'Add Viewing Party for Movie'

    expect(current_path).to  eq('/viewing_party/new')
  end
end