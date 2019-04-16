require 'rails_helper'

describe 'Forecast' do
  before :each do
    @json_city = File.read('./fixtures/place.json')
    @place = JSON.parse(@json_city, symbolize_names: true)
    @city = City.create_from_hash(@place)
    @json_weather = File.read('./fixtures/weather.json')
    @weather = JSON.parse(@json_weather, symbolize_names: true)
    @forecast = Forecast.new(@city, @weather)
  end

  it 'exists' do
    expect(@forecast).to be_a(Forecast)
  end

  describe 'attributes' do
    it '#city' do
      expect(@forecast.city).to eq('Denver')
    end

    it '#state' do
      expect(@forecast.state).to eq('CO')
    end

    it '#country' do
      expect(@forecast.country).to eq('US')
    end

    it '#timezone' do
      expect(@forecast.timezone).to eq('America/Denver')
    end

    it '#time' do
      expect(@forecast.time).to eq(1555273799)
    end

    it '#icon' do
      expect(@forecast.icon).to eq('partly-cloudy-day')
    end

    it '#temperature' do
      expect(@forecast.temperature).to eq(64.13)
    end

    it '#feels_like' do
      expect(@forecast.feels_like).to eq(64.13)
    end

    it '#humidity' do
      expect(@forecast.humidity).to eq(0.18)
    end

    it '#visibility' do
      expect(@forecast.visibility).to eq(3.37)
    end

    it '#uv_index' do
      expect(@forecast.uv_index).to eq(5)
    end

    it '#cloud_cover' do
      expect(@forecast.cloud_cover).to eq(0.44)
    end

    it '#summary' do
      expect(@forecast.summary).to eq('Partly Cloudy')
    end

    it '#hourly' do
      hourly = @forecast.hourly.all? do |h|
        h.class == Hour
      end
      expect(hourly).to eq(true)
    end

    it '#daily' do
      daily = @forecast.daily.all? do |d|
        d.class == Day
      end
      expect(daily).to eq(true)
    end

    it '#high' do
      expect(@forecast.high).to eq(66.43)
    end

    it '#low' do
      expect(@forecast.low).to eq(33.77)
    end
  end
end
