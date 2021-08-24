require 'rails_helper'

RSpec.describe MovieService do
  before :each do
    @service = MovieService.new
  end

  describe 'instance methods' do
    describe '#get_movie' do
      it 'can return information for a single movie' do
        expect(@service.get_movie('550')).to have_key(:original_title)
        expect(@service.get_movie('550')).to have_key(:vote_average)
        expect(@service.get_movie('550')).to have_key(:runtime)
      end
    end
  end
end