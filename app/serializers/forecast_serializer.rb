class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true,
  cache_length: 1.hour

  attributes :id,
             :city,
             :state,
             :country,
             :timezone,
             :time,
             :icon,
             :summary,
             :temperature,
             :feels_like,
             :humidity,
             :visibility,
             :uv_index,
             :cloud_cover

  attribute :hourly do |forecast|
    forecast.hourly.each do |hour|
      HourlySerializer.new(hour)
    end
  end

  attribute :daily do |forecast|
    forecast.daily.each do |day|
      DailySerializer.new(day)
    end
  end
end
