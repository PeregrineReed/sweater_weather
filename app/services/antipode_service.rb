class AntipodeService
  def initialize(coordinates)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
  end

  def antipode_coordinates
    json_for("?lat=#{@lat}&long=#{@lng}")
  end

  def json_for(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers['api_key'] = ENV['ANTIPODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
