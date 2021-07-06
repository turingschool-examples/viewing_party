require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:party_guests) }
    it { should have_many(:users).through(:party_guests) }
  end

  describe 'validations' do
    it { should validate_presence_of(:start_time_day) }
    it { should validate_presence_of(:movie_api_id) }
    it { should validate_numericality_of(:movie_api_id) }
    it { should validate_presence_of(:duration) }
    it { should validate_numericality_of(:duration) }
  end

end
