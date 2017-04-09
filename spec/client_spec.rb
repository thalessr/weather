require "spec_helper"

RSpec.describe Weather::Client do

  before  { @client = Weather::Client.new("your_api_key") }

  it "Returns a city's forecast Json" do
    expect(@client.forecast("Tallinn")).not_to be nil
  end

  it "Returns a city's weather Json" do
    expect(@client.weather("Tallinn")).not_to be nil
  end
end
