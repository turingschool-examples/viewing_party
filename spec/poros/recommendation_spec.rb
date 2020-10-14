require 'rails_helper'

RSpec.describe CreateRecommendation do
  it 'exists' do
    attr = { id: 12,
             title: 'Captain Marvel'
              }

    rec = CreateRecommendation.new(attr)
    expect(rec).to be_a(CreateRecommendation)
    expect(rec.title).to eq('Captain Marvel')
  end
end
