class Api::V1::ForecastController < ApplicationController
  def index
    location = GeocodeService.new(params[:location])
    coordinates = location.coordinates
    weather = WeatherService.new(coordinates)
    json render: weather.forecast
  end
end
