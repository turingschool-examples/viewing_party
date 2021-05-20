require 'rails_helper'
describe 'RentProvider' do
  it 'abstracts and encapsulates Provider Name' do
    provider_info = {
      "display_priority": 47,
      "logo_path": '/qZdEeINwQotbr1Rq15dL5G2BaAh.jpg',
      "provider_id": 358,
      "provider_name": 'DIRECTV'
    }
    provider = StreamingProvider.new(provider_info)

    expect(provider.provider_name).to eq 'DIRECTV'
  end
end
