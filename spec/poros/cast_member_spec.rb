require 'rails_helper'

RSpec.describe CastMember do
  it "exists" do
    attributes = { "character": "Don Michael Corleone",
                   "name": "Al Pacino"
                  }

    cast_member = CastMember.new(attributes)

    expect(cast_member).to be_a(CastMember)
    expect(cast_member.character).to eq(attributes[:character])
    expect(cast_member.name).to eq(attributes[:name])
  end
end
