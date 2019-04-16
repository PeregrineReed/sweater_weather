class BackgroundsFacade
  def initialize(location)
    @location = location
  end

  def image
    Background.new(service.landscape)
  end

  def service
    BackgroundsService.new(@location)
  end
end
