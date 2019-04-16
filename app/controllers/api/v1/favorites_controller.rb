class Api::V1::FavoritesController < Api::V1::BaseController
  def create
    user = find_user
    city = find_city
    user.cities << city
    head 201
  end

  def index
    user = find_user
    render json: FavoritesSerializer.new(user)
  end

  def destroy
    user = find_user
    city = find_city
    render json: CitySerializer.new(user.remove_favorite(city))
  end

  private

  def find_user
    User.find_by(api_key: favorite_params[:api_key])
  end

  def find_city
    City.find_by(place_id: favorite_params[:location])
  end

  def favorite_params
    params.permit(:api_key, :location)
  end
end
