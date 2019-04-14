class WeatherService
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def forecast
    json_for("#{ENV['DARK_SKY_KEY']}/#{@coordinates}")
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
