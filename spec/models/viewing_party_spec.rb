require 'rails_helper'

RSpec.describe ViewingParty, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :duration}
    it {should validate_presence_of :date}
  end
end
