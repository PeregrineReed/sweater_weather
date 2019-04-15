class AntipodeFacade
  def initialize(location)
    @location = location
  end

  def antipode
  end

  def service
    AntipodeService.new(@location)
  end
end
