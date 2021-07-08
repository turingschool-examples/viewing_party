require 'rails_helper'

RSpec.describe MovieService do 
  before(:each) do
    @m = MovieService.new
  end

  it 'exists' do
    expect(@m).to be_a(MovieService)
  end

  it 'can return list of top rated movies' do
    response = @m.top_rated 
    
    expect(response).to have_key("results")
    expect(response["results"]).to be_an(Array)
  end
end