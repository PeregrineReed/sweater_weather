class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def antipode
    Antipode.new(service.antipode)
  end

  def service
    AntipodeService.new(@location)
  end
end
