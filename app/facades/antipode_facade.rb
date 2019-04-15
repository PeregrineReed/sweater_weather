class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def antipode
    service.antipode
  end
  #
  # def lat_long
  #   geocode_service.coordinates
  # end

  def service
    AntipodeService.new(@location)
  end

  # def geocode_service
  #   GeocodeService.new(@location)
  # end
end
