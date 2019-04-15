require 'rails_helper'

describe 'AntipodeFacade' do
  before :each do
    @location = 'hongkong'
    @facade = AntipodeFacade.new(@location)
  end

  it 'exists' do
    expect(@facade).to be_a(AntipodeFacade)
  end
  describe 'instance methods' do
    describe '#antipode' do
      it 'returns the antipode for the given location' do
        expect(@facade.antipode).to be_a(Antipode)
      end
    end

    describe 'forecast' do
      it 'returns a hash of forecast data' do
        expect(@facade.forecast).to be_a(Hash)
        expect(@facade.forecast.keys.include?(:currently)).to eq(true)
      end
    end
  end
end
