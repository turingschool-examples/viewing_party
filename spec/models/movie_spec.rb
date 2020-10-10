require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :vote_average}
    it {should validate_presence_of :genre}
    it {should validate_presence_of :summary}
    it {should validate_presence_of :total_reviews}
  end
end
