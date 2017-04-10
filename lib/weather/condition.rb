module Weather
  class Condition
    attr_accessor :humidity, :description, :wind_speed, :date_time,
                  :temp_min, :temp, :temp_max, :rain, :snow

    class << self
      def to_object(json)
        conditions = []
        json.each do |cond|
          condition = Weather::Condition.new
          condition.description = cond['weather'][0]['description']
          condition.humidity = cond['main']['humidity']
          condition.temp = cond['main']['temp_max']
          condition.temp_min = cond['main']['temp_min']
          condition.temp_max = cond['main']['temp_max']
          condition.date_time = Time.parse(cond['dt_txt'])
          condition.wind_speed = cond['wind']['speed']
          conditions << condition
        end
        conditions
      end
    end
  end
end
