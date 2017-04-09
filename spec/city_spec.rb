require "spec_helper"
require 'byebug'

RSpec.describe Weather::City do


  it "Returns a city's information" do
    city = Weather::City.new("Tallinn")
    city.forecast("c1cc07cfb83e2e3199b7456e98c6fe7c")
    expect(city.country).not_to be nil
  end
end
