class Background
  attr_reader :id,
              :url,
              :description,
              :alt_description

  def initialize(location)
    @location = location
    @id = service.landscape[:results][0][:id]
    @url = service.landscape[:results][0][:urls][:raw]
    @description = service.landscape[:results][0][:description]
    @alt_description = service.landscape[:results][0][:alt_description]
  end

  def service
    Rails.cache.fetch("background-service-#{@location}", expires_in: 1.week) {
      BackgroundsService.new(@location)
    }
  end
end
