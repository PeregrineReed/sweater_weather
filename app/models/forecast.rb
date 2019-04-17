class Forecast
  attr_reader :id,
              :city,
              :state,
              :country,
              :timezone,
              :time,
              :icon,
              :summary,
              :temperature,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :cloud_cover,
              :high,
              :low

  def initialize(city, weather)
    @id = city.place_id
    @city = city.name
    @state = city.state
    @country = city.country
    @timezone = weather[:timezone]
    @time = weather[:currently][:time]
    @icon = weather[:currently][:icon]
    @summary = weather[:currently][:summary]
    @temperature = weather[:currently][:temperature]
    @feels_like = weather[:currently][:apparentTemperature]
    @humidity = weather[:currently][:humidity]
    @visibility = weather[:currently][:visibility]
    @uv_index = weather[:currently][:uvIndex]
    @cloud_cover = weather[:currently][:cloudCover]
    @hourly = weather[:hourly][:data]
    @daily = weather[:daily][:data]
    @high = weather[:daily][:data][0][:temperatureMax]
    @low = weather[:daily][:data][0][:temperatureMin]
  end

  def hourly
    @hourly[0..7].map do |hour|
      Hour.new(@id, hour)
    end
  end

  def daily
    @daily[0..6].map do |day|
      Day.new(@id, day)
    end
  end

  def cache_key
    "forecast/#{id}-#{time}"
  end

end
