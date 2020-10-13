require 'rails_helper'

RSpec.describe 'Movie Details page' do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "should have details for a movie", :vcr do
    visit top_movies_path

    click_link("The Shawshank Redemption")

    expect(current_path).to_not eq(top_movies_path)

    expect(page).to have_button('Create Viewing Party for Movie')

    expect(page).to have_content("The Shawshank Redemption")
    expect(page).to have_content('Vote Average: 8.7')
    expect(page).to have_content('Runtime: 2 hrs, 22 mins')
    expect(page).to have_content("Summary: Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    expect(page).to have_content("Genres: Drama, Crime")

    expect(page).to have_css(".cast", count:10)

    within(first('.cast')) do
      expect(page).to have_content('Character: Andy Dufresne')
      expect(page).to have_content('Actor: Tim Robbins')
    end

    expect(page).to have_css('.review', count:6)

    within(first('.review')) do
      expect(page).to have_content('author: elshaarawy')
      expect(page).to have_content('review: very good movie 9.5/10 محمد الشعراوى')
    end
  end
end
