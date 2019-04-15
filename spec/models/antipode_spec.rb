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
    @file1 = File.read('./fixtures/antipode.json')
    @file2 = File.read('./fixtures/weather.json')
    @data = JSON.parse(@file1, symbolize_names: true)
    @weather = JSON.parse(@file2, symbolize_names: true)
    @antipode = Antipode.new(@location, @coordinates, @data, @weather)
  end
  it 'exists' do
    expect(@antipode).to be_a(Antipode)
  end

  describe 'attributes' do
    it 'id' do
      expect(@antipode.id).to eq('1')
    end

    it 'type' do
      expect(@antipode.type).to eq('antipode')
    end

    it 'location_name' do
      expect(@antipode.location_name).to eq('Yavi Department')
    end

    it 'forecast' do
      expect(@antipode.forecast).to eq({
        summary: "Partly Cloudy",
        current_temperature: 64.13,
    	})
    end

    it 'search_location' do
      expect(@antipode.search_location).to eq('Hong Kong')
    end
  end
end
