require 'rails_helper'

describe 'Hour' do
  before :each do
    @data = {
      time: 1555279200,
      summary: "Mostly Cloudy",
      icon: "partly-cloudy-day",
      precipIntensity: 0,
      precipProbability: 0,
      temperature: 65.32,
      apparentTemperature: 65.32,
      dewPoint: 22.28,
      humidity: 0.19,
      pressure: 1002.65,
      windSpeed: 5.93,
      windGust: 16.26,
      windBearing: 294,
      cloudCover: 0.6,
      uvIndex: 3,
      visibility: 3.25,
      ozone: 345.58
    }
    @hour = Hour.new(1, @data)
  end

  it 'exists' do
    expect(@hour).to be_a(Hour)
  end

  describe 'attributes' do
    it '#id' do
      expect(@hour.id).to eq(1)
    end

    it '#time' do
      expect(@hour.time).to eq(1555279200)
    end

    it '#icon' do
      expect(@hour.icon).to eq('partly-cloudy-day')
    end

    it '#temperature' do
      expect(@hour.temperature).to eq(65.32)
    end

    it '#summary' do
      expect(@hour.summary).to eq('Mostly Cloudy')
    end
  end
end
