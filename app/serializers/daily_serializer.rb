class DailySerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true,
  cache_length: 1.hour
  
  attributes :id,
             :time,
             :high,
             :low,
             :icon,
             :summary,
             :precip_percent,
             :precip_type
end
