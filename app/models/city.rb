class City
  attr_reader :name,
              :state,
              :country,
              :id,
              :latitude,
              :longitude

  def initialize(data)
    titles = data[:results][0][:address_components]
    @name = titles[0][:long_name]
    @state = titles[2][:short_name]
    @country = titles[3][:short_name]
    @id = data[:results][0][:place_id]
    coordinates = data[:results][0][:geometry][:location]
    @latitude = coordinates[:lat]
    @longitude = coordinates[:lng]
  end
end
