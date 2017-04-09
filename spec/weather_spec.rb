require "spec_helper"

RSpec.describe Weather do
  it "has a version number" do
    expect(Weather::VERSION).not_to be nil
  end
end
