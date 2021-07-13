require 'rails_helper'

RSpec.describe 'API' do
  it 'does thangs' do
    APIServices.movie_details(278)
  end
end
