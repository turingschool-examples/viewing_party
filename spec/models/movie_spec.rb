require 'rails_helper'

describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:api_id)}
    it {should validate_numericality_of(:duration_of_movie) }
  end

  describe 'relationships' do
    it {should have_many(:viewings)}
  end
end
