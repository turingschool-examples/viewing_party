require 'rails_helper'

RSpec.describe CreateActor do
  it 'exists' do
    attr = { cast_id: 12,
                character: 'Spiderman',
                credit_id: 2,
                gender: 'Male',
                id: 24,
                name: "Tobey Maguire",
                profile_path: 'profile_path'
              }

      actor = CreateActor.new(attr)
      expect(movie).to be_a(CreateMovie)
      expect(movie.title).to eq('The Dogs')
      expect(movie.overview).to eq('Great Movie')
  end
end

def initialize(attributes)
  @cast_id = attributes[:cast_id]
  @character = attributes[:character]
  @credit_id = attributes[:credit_id]
  @gender = attributes[:gender]
  @id = attributes[:id]
  @name = attributes[:name]
  @profile_path = attributes[:profile_path]
