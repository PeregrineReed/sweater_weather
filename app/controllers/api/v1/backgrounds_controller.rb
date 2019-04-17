class Api::V1::BackgroundsController < Api::V1::BaseController
  def show
    @background = Background.new(params[:location])
    render json: BackgroundSerializer.new(@background)
  end
end
