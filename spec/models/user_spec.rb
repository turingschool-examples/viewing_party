require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'relationships' do
    it { should have_many(:friends).dependent(:destroy) }
    it { should have_many(:friendees).class_name('User') }
    it { should have_many(:frienders).class_name('User') }

    it { should have_many(:attendees).dependent(:destroy) }
    it { should have_many(:movie_parties) }
    # it { should have_many(:viewing_parties).dependent(:destroy)}
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:email) }
  #   it { should validate_uniqueness_of(:email) }
  #   it { should validate_presence_of(:password_digest) }
  # end

end
