class Day
  attr_reader :id,
              :time,
              :high,
              :low,
              :icon,
              :summary,
              :precip_percent,
              :precip_type

  def initialize(id, data)
    @id = id
    @time = data[:time]
    @high = data[:temperatureMax]
    @low = data[:temperatureMin]
    @icon = data[:icon]
    @summary = data[:summary]
    @precip_percent = data[:precipProbability]
    @precip_type = data[:precipType]
  end
end
