require 'rails_helper'

describe 'WeatherService' do
  before :each do
    @latitude = 39.7507834
    @longitude = -104.9964355
    @service = WeatherService.new(@latitude, @longitude)
  end

  it 'exists' do
    expect(@service).to be_a(WeatherService)
  end

  describe 'instance mathods' do
    describe '#forecast' do
      it 'returns forecast' do
        expect(@service.forecast[:latitude]).to eq(39.7507834)
        expect(@service.forecast[:longitude]).to eq(-104.9964355)
      end
    end
  end
end
