class WeatherService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def forecast
    json_for("#{ENV['DARK_SKY_KEY']}/#{@latitude},#{@longitude}")
  end

  def json_for(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.darksky.net/forecast/") do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
