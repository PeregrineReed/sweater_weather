class GeocodeService
  def initialize(address)
    @address = address
  end

  def coordinates
    results = json_for("?address=#{@address}")
    results[:results][0][:geometry][:location]
  end

  def address
    json_for("?address=#{@address}")
  end

  def city_attributes
    titles = address[:results][0][:address_components]
    coordinates = address[:results][0][:geometry][:location]
    attributes = {
      name: titles[0][:long_name],
      state: titles[2][:short_name],
      country: titles[3][:short_name],
      place_id: address[:results][0][:place_id],
      latitude: coordinates[:lat],
      longitude: coordinates[:lng]
    }
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
