require 'rails_helper'

describe 'AntipodeService' do
  before :each do
    @lat_long = {
      lat: 27,
      lng: -82
    }
    @service = AntipodeService.new(@lat_long)
  end

  it 'exists' do
    expect(@service).to be_a(AntipodeService)
  end

  describe 'instance methods' do
    describe 'antipode_coordinates' do
      it 'returns antipode coordinates for given lat and lng' do
        lat_long = {
          lat: -27,
          long: 98
        }
        expect(@service.antipode_coordinates[:data][:attributes]).to eq(lat_long)
      end
    end
  end
end
