require 'rails_helper'

RSpec.describe ViewPartyAttendee, type: :model do
  describe 'Relationships' do
    it {should belong_to :view_party}
    it {should belong_to :user}
  end
end
