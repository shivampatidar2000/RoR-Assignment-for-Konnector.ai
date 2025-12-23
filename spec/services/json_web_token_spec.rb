require "rails_helper"

RSpec.describe JsonWebToken do
  let(:payload) { { user_id: 1 } }
  it "encodes and decodes token" do
    token = described_class.encode(payload)
    decoded = described_class.decode(token)

    expect(decoded[:user_id]).to eq(1)
  end

  it "returns nil for invalid token" do
    expect(described_class.decode("invalid")).to be_nil
  end
end
