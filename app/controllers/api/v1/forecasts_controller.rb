class Api::V1::ForecastsController < Api::V1::BaseController
  def show
    city = City.find_or_create_from_geocode(params[:location])
    render json: ForecastSerializer.new(city.forecast)
  end
end
