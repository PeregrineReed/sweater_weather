class Api::V1::UsersController < Api::V1::BaseController
  def create
    @user = User.create_if_valid(user_params)
    @user.is_a?(User) ? success : error
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def success
    render status: 201, json: { api_key: @user.api_key }
  end

  def error
    render status: 409, json: save_error
  end
end
