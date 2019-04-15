class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def antipode
    antipode_service.antipode
  end

  def lat_long
    geocode_service.coordinates
  end

  def antipode_service
    AntipodeService.new(lat_long)
  end

  def geocode_service
    GeocodeService.new(@location)
  end
end
