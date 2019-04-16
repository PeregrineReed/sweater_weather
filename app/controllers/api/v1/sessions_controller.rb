class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      render status: 200, json: { api_key: user.api_key }
    else
      head 401
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
