require 'rails_helper'

describe 'Geocode Service' do
  before :each do
    @location = "1331+17th+Street,+Denver,+CO"
    @service = GeocodeService.new(@location)
  end

  it 'exists' do
    expect(@service).to be_a(GeocodeService)
  end

  describe 'instance methods' do
    describe '#conn' do
      it 'has a faraday connection' do
        expect(@service.conn).to be_a(Faraday::Connection)
      end
    end

    describe '#coordinates' do
      it 'returns the lat and long of the coordinates' do
        expect(@service.coordinates)
          .to eq({
            lat: 39.7507834,
            lng: -104.9964355
          })
      end
    end
  end
end
