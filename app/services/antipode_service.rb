class AntipodeService < GeocodeService
  attr_reader :location

  def initialize(location)
    @location = location
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
  end

  def coordinates
    results ||= json_for("?address=#{@location}")
    @location = results[:results][0][:address_components][0][:long_name]
    results[:results][0][:geometry][:location]
  end

  def antipode
    lat_lng = antipode_coordinates[:data][:attributes].values.join(',')
    json_for("?latlng=#{lat_lng}")
  end

  def antipode_coordinates
    json_for_antipode("?lat=#{@lat}&long=#{@lng}")
  end

  def json_for_antipode(url)
    response = antipode_conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def antipode_conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers['api_key'] = ENV['ANTIPODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
