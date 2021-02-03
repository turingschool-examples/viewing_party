require 'rails_helper'

RSpec.describe Party, type: :model do
  it {should validate_presence_of :movie}
  it {should validate_presence_of :start_time}

  it {should belong_to :movie}
end
