require 'rails_helper'

RSpec.describe MoviedbService do
  before(:each) do
    @service = MoviedbService.new
  end

  xit "returns top 20 movies" do
    expect(@service.get_popular_movies.count).to eq(20)
  end
end
