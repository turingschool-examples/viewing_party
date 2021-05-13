require 'rails_helper'

describe 'user dashboard' do
  it 'shows all movies for a certain user' do
    visit dashboard_path
    expect(current_path).to eq('/dashboard')
  end
end
