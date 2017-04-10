require "spec_helper"
require 'byebug'

RSpec.describe Weather::City do


  it "Returns a city's information" do
    city = Weather::City.new("Tallinn")
    city.forecast("your_api_key")
    expect(city.country).not_to be nil
  end
end
