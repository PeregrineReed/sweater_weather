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
              :hourly,
              :daily,
              :high,
              :low

  def initialize(city, forecast)
    @id = city.place_id
    @city = city.name
    @state = city.state
    @country = city.country
    @timezone = forecast[:timezone]
    @time = forecast[:currently][:time]
    @icon = forecast[:currently][:icon]
    @summary = forecast[:currently][:summary]
    @temperature = forecast[:currently][:temperature]
    @feels_like = forecast[:currently][:apparentTemperature]
    @humidity = forecast[:currently][:humidity]
    @visibility = forecast[:currently][:visibility]
    @uv_index = forecast[:currently][:uvIndex]
    @cloud_cover = forecast[:currently][:cloudCover]
    @hourly = forecast[:hourly][:data].map do |hour|
      Hour.new(@id, hour)
    end
    @daily = forecast[:daily][:data].map do |day|
      Day.new(@id, day)
    end
    @high = @daily[0].high
    @low = @daily[0].low
  end

  def cache_key
    "forecast/#{id}-#{time}"
  end

end
