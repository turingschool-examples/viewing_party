require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :duration}
  end
end
