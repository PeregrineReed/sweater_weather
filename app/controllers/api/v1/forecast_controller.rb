class Api::V1::ForecastController < ApplicationController
  def index
    weather = WeatherFacade.new(params[:location])
    json render: ForecastSerializer.new(weather.forecast)
  end
end
