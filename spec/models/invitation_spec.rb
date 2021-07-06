require 'rails_helper'

describe Invitation do
  describe 'relationships' do
    it {should belong_to(:parties)}
    it {should belong_to(:attendees)}
  end
end
