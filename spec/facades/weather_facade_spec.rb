require 'rails_helper'

describe 'WeatherFacade' do
  before :each do
    @location = "Denver, CO"
    @facade = WeatherFacade.new(@location)
  end
  it 'exists' do
    expect(@facade).to be_a(WeatherFacade)
  end

  describe 'instance methods' do
    describe '#coordinates' do
      it 'returns coordinates for the location' do
        expect(@facade.coordinates).to eq('39.7392358,-104.990251')
      end
    end
    describe '#forecast' do
      it 'returns the forecast for the coodinates' do
        expect(@facade.forecast.city).to eq('Denver')
        expect(@facade.forecast.state).to eq('CO')
      end
    end
  end
end
