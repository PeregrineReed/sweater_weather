class GeocodeService
  def initialize(address)
    @address = address
  end

  def coordinates
    results = json_for("?address=#{@address}")
    results[:results][0][:geometry][:location]
  end

  def address
    results = json_for("?address=#{@address}")
    results[:results][0][:formatted_address]
      .split(', ')
  end

  def json_for(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params['key'] = ENV['GEOCODE_KEY']
      f.adapter Faraday.default_adapter
    end
  end
end
