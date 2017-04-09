require "spec_helper"

RSpec.describe Weather::Client do

  before  { @client = Weather::Client.new("c1cc07cfb83e2e3199b7456e98c6fe7c") }

  it "Returns a city's forecast Json" do
    expect(@client.forecast("Tallinn")).not_to be nil
  end

  it "Returns a city's weather Json" do
    expect(@client.weather("Tallinn")).not_to be nil
  end
end
