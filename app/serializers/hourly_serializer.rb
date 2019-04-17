class HourlySerializer
  include FastJsonapi::ObjectSerializer
  cache_options enabled: true,
  cache_length: 1.hour
  
  attributes :id,
             :time,
             :temperature,
             :icon,
             :summary
end
