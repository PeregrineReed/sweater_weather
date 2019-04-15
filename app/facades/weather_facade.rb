class WeatherFacade
  def initialize(location)
    @location = location
  end

  def coordinates
    lat_long = geocode_service.coordinates
    lat_long.values.join(',')
  end

  def city
    City.new(geocode_service.address)
  end

  def forecast
    Forecast.new(city, weather_service.forecast)
  end

  def geocode_service
    GeocodeService.new(@location)
  end

  def weather_service
    WeatherService.new(city.latitude, city.longitude)
  end
end
