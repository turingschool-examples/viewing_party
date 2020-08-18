require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :user_name}
  end

  describe 'Relationships' do
    it {should have_many(:view_parties).through(:view_party_attendees)}
    it {should have_many :view_party_attendees}
    it {should have_many :view_parties}
  end
end
