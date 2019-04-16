class BackgroundsController < ApplicationController
  def index
    render json: BackgroundsFacade.new(params[:location]).image
  end
end
