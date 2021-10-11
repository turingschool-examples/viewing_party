require 'rails_helper'

RSpec.describe Showing do
  it 'exists' do
    party = Showing.create!(movie_title: "yo", duration: 69, day: "asd", start_time: "456")

    expect(party.movie_title).to eq("yo")
  end
  describe 'validations' do
    it {should validate_presence_of(:movie_title)}
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:day)}
    it {should validate_presence_of(:start_time)}
  end
end
