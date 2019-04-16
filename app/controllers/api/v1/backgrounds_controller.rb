class Api::V1::BackgroundsController < Api::V1::BaseController
  def index
    @background = BackgroundsFacade.new(params[:location]).image
    render json: BackgroundSerializer.new(@background)
  end
end
