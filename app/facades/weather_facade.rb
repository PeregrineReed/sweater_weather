class WeatherFacade
  def initialize(location)
    @location = location
  end

  def coordinates
    lat_long = geocode_service.coordinates
    lat_long.values.join(',')
  end

  def forecast
    Forecast.new(weather_service.forecast)
  end

  def geocode_service
    GeocodeService.new(@location)
  end

  def weather_service
    WeatherService.new(coordinates)
  end
end
