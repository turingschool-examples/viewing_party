require 'rails_helper'

RSpec.describe Attendee, type: :model do

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:movie_party) }
  end

  describe 'validations' do
    it { should validate_presence_of :user }
    it { should validate_presence_of :movie_party }
    # it { should validate_uniqueness_of(:user).scoped_to(:movie_party)}

  end



end
