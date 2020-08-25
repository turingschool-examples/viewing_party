require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'validations' do
    it {should validate_presence_of :movie_title}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :runtime}
  end
  describe 'relationships' do
    it {should have_many :user_view_parties}
    it {should have_many(:users).through(:user_view_parties)}
  end
end
