require 'rails_helper'

describe Party do
  describe 'validations' do
    it {should validate_presence_of(:host)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:time)}
    it {should validate_presence_of(:duration)}
    it {should validate_presence_of(:movie_id)}
    it {should validate_presence_of(:movie_title)}
  end

  describe 'relationships' do
    it {should belong_to(:host)}
  end
end
