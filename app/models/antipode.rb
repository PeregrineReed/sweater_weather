class Antipode
  attr_reader :id,
              :type,
              :location_name,
              :forecast,
              :search_location

  def initialize(location, coordinates, place, forecast)
    @id = coordinates[:data][:id]
    @type = coordinates[:data][:type]
    @location_name = place[:results][0][:address_components][0][:long_name]
    @forecast = {
      summary: forecast[:currently][:summary],
      current_temperature: forecast[:currently][:temperature]
    }
    @search_location = location
  end
end
