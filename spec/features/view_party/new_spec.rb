require 'rails_helper'

RSpec.describe 'Create Party' do

  it 'has a form' do
    visit new_viewing_party_path

    find_field :duration
    find_field :date

    find_button 'Create Party'
  end
  
end
