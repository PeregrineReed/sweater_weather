class Background
  attr_reader :id,
              :url,
              :description,
              :alt_description

  def initialize(data)
    @id = data[:results][0][:id]
    @url = data[:results][0][:urls][:raw]
    @description = data[:results][0][:description]
    @alt_description = data[:results][0][:alt_description]
  end
end
