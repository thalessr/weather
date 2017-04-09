module Weather
  class Client
    attr_accessor :api_key

    def initialize(api_key = nil)
       @api_key = api_key || self.class.api_key
    end

    def uri(url)
      URI.parse(URI.escape(url))
    end

    def weather(city)
      fail 'API key not provided' unless @api_key
      url = base_url
      url += 'weather?'
      url += "q=#{city}&APPID=#{@api_key}"
      data_json(url)
    end

    def forecast(city)
      fail 'API key not provided' unless @api_key
      url = base_url
      url += 'forecast?'
      url += "q=#{city}&APPID=#{@api_key}"
      data_json(url)
    end

    def data_json(url)
      JSON.parse(Net::HTTP.get(uri(url)))
    end

    def base_url
      "http://api.openweathermap.org/data/2.5/"
    end
    class << self
      attr_accessor :api_key
    end
  end
end
