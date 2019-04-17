class Background

  def initialize(location)
    @location = location
  end

  def service
    Rails.cache.fetch("background-service-#{@location}", expires_in: 1.week) {
      BackgroundsService.new(@location)
    }
  end

  def id
    service.landscape[:results][0][:id]
  end

  def url
    service.landscape[:results][0][:urls][:raw]
  end

  def description
    service.landscape[:results][0][:description]
  end

  def alt_description
    service.landscape[:results][0][:alt_description]
  end


end
