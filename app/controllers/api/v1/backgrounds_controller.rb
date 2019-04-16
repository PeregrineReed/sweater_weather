class Api::V1::BackgroundsController < ApplicationController
  def index
    @background = BackgroundsFacade.new(params[:location]).image
    render json: BackgroundSerializer.new(@background)
  end
end
