class Api::V1::ForecastController < Api::V1::BaseController
  def index
    weather = WeatherFacade.new(params[:location])
    render json: ForecastSerializer.new(weather.forecast)
  end
end
