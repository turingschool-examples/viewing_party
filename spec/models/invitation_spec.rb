require 'rails_helper'

describe Invitation do
  describe 'relationships' do
    it {should belong_to(:party)}
    it {should belong_to(:invitee)}
  end
end
