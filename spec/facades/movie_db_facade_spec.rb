require 'rails_helper'

RSpec.describe MovieDbFacade do
  it 'processes movie data and returns Movie objects' do
    films = MovieDbFacade.get_films

    expect(films.count).to eq(20)
    films.each do |film|
      expect(film).to be_an_instance_of(Film)
    end
  end
end
