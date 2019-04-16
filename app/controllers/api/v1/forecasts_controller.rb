class Api::V1::ForecastsController < Api::V1::BaseController
  def show
    weather = WeatherFacade.new(params[:location])
    render json: ForecastSerializer.new(weather.forecast)
  end
end
