require "rails_helper"

RSpec.describe Detail do
  it "exists" do
    attributes = {
      original_title: "The Godfather: Part II",
      runtime: 243,
      vote_average: 10,
      genres: ["Drama"],
      overview: "DRAMMAAAHHH",
      id: 240
    }

    detail = Detail.new(attributes)

    expect(detail).to be_a Detail
    expect(detail.title).to eq("The Godfather: Part II")
    expect(detail.runtime).to eq(243)
    expect(detail.vote_avg).to eq(10)
    expect(detail.genres).to eq(["Drama"])
    expect(detail.summary).to eq("DRAMMAAAHHH")
    expect(detail.details_id).to eq(240)
    expect(detail.details_id).to_not eq(241)
  end
end
