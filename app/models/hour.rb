class Hour
  attr_reader :id,
              :time,
              :temperature,
              :icon,
              :summary

  def initialize(id, data)
    @id = id
    @time = data[:time]
    @temperature = data[:temperature]
    @icon = data[:icon]
    @summary = data[:summary]
  end

  def cache_key
    "hour/#{id}-#{time}"
  end
end
