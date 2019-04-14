require 'rails_helper'

describe 'WeatherFacade' do
  before :each do
    @location = "1331 17th St, Denver, CO"
    @facade = WeatherFacade.new(@location)
  end
  it 'exists' do
    expect(@facade).to be_a(WeatherFacade)
  end

  describe 'instance methods' do
    describe '#coordinates' do
      it 'returns coordinates for the location' do
        expect(@facade.coordinates).to eq('39.7507834,-104.9964355')
      end
    end
    describe '#forecast' do
      it 'returns the forecast for the coodinates' do
        expect(@facade.forecast).to eq('')
      end
    end
  end
end
