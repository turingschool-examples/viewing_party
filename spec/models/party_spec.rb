require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :party_duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :host_id }
    it { should validate_presence_of :runtime }
    it { should validate_numericality_of :runtime }
    it { should validate_numericality_of(:party_duration).is_greater_than_or_equal_to(:runtime) }
    it { should validate_numericality_of :host_id }
  end
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }
  end
end
