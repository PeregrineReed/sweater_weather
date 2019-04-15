require 'rails_helper'

describe 'AntipodeService' do
  before :each do
    @location = 'hongkong'
    @service = AntipodeService.new(@location)
  end

  it 'exists' do
    expect(@service).to be_a(AntipodeService)
  end

  describe 'instance methods' do
    describe '#antipode_coordinates' do
      it 'returns antipode coordinates for given lat and lng' do
        lat_long = {
          lat: -22.3193039,
          long: -65.8306389
        }
        expect(@service.antipode_coordinates[:data][:attributes]).to eq(lat_long)
      end
    end

    describe '#location_coordinates' do
      it 'returns lat and long for location' do
        lat_long = {
          lat: 22.3193039,
          lng: 114.1693611
        }
        expect(@service.location_coordinates).to eq(lat_long)
      end
    end
  end
end
