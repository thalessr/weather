module Weather
  class City
    attr_reader :id, :country, :latitude, :longitude, :conditions
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def weather(api_key = nil)
      client = Weather::Client.new(api_key)
      json = client.weather(@name)
      to_object(json)
      self
    end

    def forecast(api_key = nil)
      client = Weather::Client.new(api_key)
      json = client.forecast(@name)
      to_object(json)
      self
    end

    def to_object(json)
      @country = json['city']['country']
      @id = json['city']['id']
      coordinate = json['city']['coord']
      if coordinate
        @longitude = coordinate['lon']
        @latitude = coordinate['lat']
      end
      @conditions = Weather::Condition.to_object(json['list'])
    end

    def to_s
      "id:#{@id} #{@name}, #{@country} lat: #{@latitude} long: #{@longitude}"
    end
  end
end
