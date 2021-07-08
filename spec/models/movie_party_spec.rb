require 'rails_helper'

RSpec.describe MovieParty, type: :model do

  describe 'relationships' do
    it { should have_many(:attendees) }
    it { should have_many(:users) }
  end



  describe 'validations' do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :date_time }
  end
end
