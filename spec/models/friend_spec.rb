require 'rails_helper'

RSpec.describe Friend, type: :model do

  describe 'relationships' do
    it { should belong_to :friendee }
    it { should belong_to :friender }
  end

  describe 'validations' do
    it { should validate_presence_of :friendee }
    it { should validate_presence_of :friender }
  end

end
