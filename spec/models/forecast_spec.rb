require 'rails_helper'

describe 'Forecast' do
  before :each do
    @address = ['Denver', 'CO', 'USA']
    @weather = File.open('./fixtures/weather.json')
    @forecast = Forecast.new(@address, @weather)
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
      expect(@forecast.country).to eq('USA')
    end

    it '#hour' do
      expect(@forecast.hour).to eq(14)
    end

    it '#minute' do
      expect(@forecast.minute).to eq(29)
    end

    it '#date' do
      expect(@forecast.date).to eq('4/14/2019')
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
      expect(@forecast.current).to eq(3.37)
    end

    it '#uv_index' do
      expect(@forecast.current).to eq(5)
    end

    it '#summary' do
      expect(@forecast.current).to eq('Partly Cloudy')
    end

    it '#hourly' do
      hourly = @forecast.hourly.all? do |h|
        h.class == Hour
      end
      expect(@forecast.hourly).to be_a()
    end

    it '#daily' do
      daily = @forecast.daily.all? do |d|
        d.class == Day
      end
      expect(daily).to be_a(true)
    end
  end
end
