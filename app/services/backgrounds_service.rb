class BackgroundsService
  def initialize(location)
    @location = location
  end

  def landscape
    json_for("search/photos?query=#{@location}&orientation=landscape")
  end

  private

  def json_for(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.unsplash.com/') do |f|
      f.headers['Authorization'] = "Client-ID #{ENV['UNSPLASH_KEY']}"
      f.adapter Faraday.default_adapter
    end
  end
end
