class CitySerializer
  include FastJsonapi::ObjectSerializer
  attribute :location do |city|
    "#{city.name}, #{city.state}, #{city.country}"
  end
  attribute :current_weather do |city|
    {
      timezone: city.forecast.timezone,
      time: city.forecast.time,
      icon: city.forecast.icon,
      summary: city.forecast.summary,
      temperature: city.forecast.temperature,
      feels_like: city.forecast.feels_like,
      humidity: city.forecast.humidity,
      visibility: city.forecast.visibility,
      uv_index: city.forecast.uv_index,
      cloud_cover: city.forecast.cloud_cover,
      high: city.forecast.high,
      low: city.forecast.low
    }
  end
end
