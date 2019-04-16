class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    city = City.find_by(place_id: favorite_params[:location])
    user.cities << city
    head 201
  end

  def index
    user = User.find_by(api_key: favorite_params[:api_key])
    render json: user.cities
  end

  def destroy
  end

  private

  def favorite_params
    params.permit(:api_key, :location)
  end
end
