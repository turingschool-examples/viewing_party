require "rails_helper"

RSpec.describe Cast do
  it "exists" do
    attributes = {
      name: "Marlon Brando",
      character: "Vito Corleone",
    }

    cast = Cast.new(attributes)

    expect(cast).to be_a Cast
    expect(cast.name).to eq("Marlon Brando")
    expect(cast.character).to eq("Vito Corleone")
  end
end
