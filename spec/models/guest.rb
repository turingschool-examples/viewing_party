require 'rails_helper'

describe Guest, type: :model do

  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :party }
  end
end
