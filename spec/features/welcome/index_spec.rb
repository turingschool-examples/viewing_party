require 'rails_helper'

RSpec.describe 'The welcome landing page' do
  before(:each) do
    visit root_path
  end

  it 'is on the right page' do
    expect(current_path).to eq('/')
  end

  it 'has a form to login'

  it 'has a link to register if you arent already'
end
