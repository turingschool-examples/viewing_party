require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :party_duration }
    it { should validate_presence_of :party_date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :runtime }
    it { should validate_numericality_of :runtime }
    # it { should validate_numericality_of(:party_duration).is_greater_than_or_equal_to(:runtime) }
    it { should validate_numericality_of :user_id }
  end
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:users).through(:user_parties) }

  end

  describe 'instance methods' do 
    it "#host_name" do
      user = User.create!(user_name: 'johnnycage@test.com', password: '123')
      party = Party.create!(user_id: user.id, movie_title: 'Mortal Kombat', party_duration: 110, party_date: "2021-05-31", start_time: "8:00", runtime: 100)

      expect(party.host_name).to eq('johnnycage@test.com')
    end 
  end
end
