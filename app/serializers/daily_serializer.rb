class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :time,
             :high,
             :low,
             :icon,
             :summary,
             :precip_percent,
             :precip_type
end
