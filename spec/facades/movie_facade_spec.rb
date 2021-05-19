require 'rails_helper'

RSpec.describe 'MovieService' do
  it 'returns an array of Film objects' do
    stub_search_by_title
    facade = MovieFacade.search_by_title('Hamilton')

    expect(facade).to be_an(Array)
    expect(facade.first).to be_a(Film)
  end
end
