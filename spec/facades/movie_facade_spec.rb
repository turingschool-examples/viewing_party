require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    
  end

  it 'can verify that it exists' do
    movie_facade = MovieFacade.new
                      
    expect(movie_facade).to be_an_instance_of(MovieFacade)
    expect(movie_facade.service).to be_an_instance_of(MovieService)
  end


end
