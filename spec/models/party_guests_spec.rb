require 'rails_helper'

describe PartyGuest do
  descripte 'relationships' do
    it {should belong_to(:party)}
    it {should belong_to(:user)}
  end
end
