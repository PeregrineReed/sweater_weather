require 'rails_helper'

describe 'Daily' do
  before :each do
    @data = {
      time: 1555221600,
      summary: "Mostly cloudy throughout the day.",
      icon: "partly-cloudy-day",
      sunriseTime: 1555244691,
      sunsetTime: 1555292261,
      moonPhase: 0.33,
      precipIntensity: 0,
      precipIntensityMax: 0,
      precipProbability: 0,
      temperatureHigh: 65.45,
      temperatureHighTime: 1555282800,
      temperatureLow: 42.37,
      temperatureLowTime: 1555329600,
      apparentTemperatureHigh: 65.45,
      apparentTemperatureHighTime: 1555282800,
      apparentTemperatureLow: 38.84,
      apparentTemperatureLowTime: 1555329600,
      dewPoint: 23.61,
      humidity: 0.4,
      pressure: 1007.02,
      windSpeed: 1.87,
      windGust: 21.25,
      windGustTime: 1555286400,
      windBearing: 161,
      cloudCover: 0.52,
      uvIndex: 6,
      uvIndexTime: 1555268400,
      visibility: 5.22,
      ozone: 342.91,
      temperatureMin: 33.77,
      temperatureMinTime: 1555239600,
      temperatureMax: 65.45,
      temperatureMaxTime: 1555282800,
      apparentTemperatureMin: 29.21,
      apparentTemperatureMinTime: 1555239600,
      apparentTemperatureMax: 65.45,
      apparentTemperatureMaxTime: 1555282800
    }
    @day = Day.new(1, @data)
  end

  it 'exists' do
    expect(@day).to be_a(Day)
  end

  describe 'attributes' do
    it '#id' do
      expect(@day.id).to eq(1)
    end

    it '#time' do
      expect(@day.time).to eq(1555221600)
    end

    it '#icon' do
      expect(@day.icon).to eq('partly-cloudy-day')
    end

    it '#high' do
      expect(@day.high).to eq(65.45)
    end

    it '#low' do
      expect(@day.low).to eq(33.77)
    end

    it '#precip_percent' do
      expect(@day.precip_percent).to eq(0)
    end

    it '#precip_type' do
      expect(@day.precip_type).to eq(nil)
    end

    it '#summary' do
      expect(@day.summary).to eq('Mostly cloudy throughout the day.')
    end
  end

  describe 'serializer' do
    it 'returns a serialized hash' do
      serializer = DailySerializer.new(@day)
      expect(serializer).to be_a(DailySerializer)
      expect(serializer.to_hash[:data][:type]).to eq(:daily)
    end
  end
end
