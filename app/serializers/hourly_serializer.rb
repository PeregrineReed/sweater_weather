class HourlySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
             :time,
             :temperature,
             :icon,
             :summary
end
