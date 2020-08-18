require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :duration}
    it {should validate_presence_of :date}
  end

  describe 'Relationships' do
    it {should belong_to :user}
    it {should have_many :view_party_attendees}
    it {should have_many(:users).through(:view_party_attendees)}
  end
end
