class Api::V1::BaseController < ActionController::API

  def save_error
    { error: 'Something went wrong, your account could not be created with those credentials.' }
  end

end
