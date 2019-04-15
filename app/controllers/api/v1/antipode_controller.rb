class Api::V1::AntipodeController < ApplicationController
  def index
    facade = AntipodeFacade.new(params[:loc])
    render json: facade.antipode
  end
end
