require "rails_helper"

RSpec.describe Upcoming do
  it "exists" do
    attributes = {
      title: "Roald Dahl's The Witches",
      release_date: "2020-10-26"
    }

    upcoming = Upcoming.new(attributes)

    expect(upcoming).to be_a Upcoming
    expect(upcoming.title).to eq("Roald Dahl's The Witches")
    expect(upcoming.release_date).to eq("2020-10-26")

  end
end
