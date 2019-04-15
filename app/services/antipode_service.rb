class AntipodeService
  attr_reader :location

  def initialize(location)
    @location = location
    @lat = location_coordinates[:lat]
    @lng = location_coordinates[:lng]
  end

  def location_coordinates
    results ||= json_for_location("?address=#{@location}")
    @location = results[:results][0][:address_components][0][:long_name]
    results[:results][0][:geometry][:location]
  end

  def antipode
    lat_lng = antipode_coordinates[:data][:attributes].values.join(',')
    json_for_location("?latlng=#{lat_lng}")
  end

  def antipode_coordinates
    json_for_antipode("?lat=#{@lat}&long=#{@lng}")
  end

  def json_for_antipode(url)
    response = antipode_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def json_for_location(url)
    response = location_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def antipode_conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers['api_key'] = ENV['ANTIPODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def location_conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params['key'] = ENV['GEOCODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
