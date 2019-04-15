class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def antipode
    Antipode.new(
      service.location,
      service.antipode_coordinates,
      service.antipode,
      forecast
    )
  end

  def service
    AntipodeService.new(@location)
  end

  def forecast
    coordinates = service.antipode_coordinates[:data][:attributes].values
    WeatherService.new(coordinates[0], coordinates[1]).forecast
  end
end
