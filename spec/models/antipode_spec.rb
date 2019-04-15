require 'rails_helper'

describe 'Antipode' do
  before :each do
    @location = "Hong Kong"
    @coordinates = {
      data: {
        id: "1",
        type: "antipode",
        attributes: {
          lat: -27,
          long: 98
        }
      }
    }
    @file = File.read('./fixtures/antipode.json')
    @data = JSON.parse(@file, symbolize_names: true)
    @antipode = Antipode.new(@location,@data)
  end
  it 'exists' do
    expect(@antipode).to be_a(Antipode)
  end

  describe 'attributes' do
    it 'id' do
      expect(@antipode.id).to eq('1')
    end

    it 'type' do
      expect(@antipode.id).to eq('antipode')
    end

    it 'location_name' do
      expect(@antipode.location_name).to eq('Yavi Department')
    end

    it 'forecast' do
      expect(@antipode.forecast).to eq({
        summary: "Mostly Cloudy",
        current_temperature: 72,
    	})
    end

    it 'search_location' do
      expect(@antipode.search_location).to eq('Hong Kong')
    end
  end
end
