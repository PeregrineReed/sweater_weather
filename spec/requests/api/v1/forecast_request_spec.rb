require 'rails_helper'

describe 'Forecast API' do
  it 'returns daily forecast' do

    get '/api/v1/forecast?location=1331+17th+Street,+Denver,+CO'

    forecast = JSON.parse(response.body, symbolize_names: true)
    forecast_today = forecast[:data][:attributes].keys

    expect(forecast_today.include?(:id)).to eq(true)
    expect(forecast_today.include?(:city)).to eq(true)
    expect(forecast_today.include?(:state)).to eq(true)
    expect(forecast_today.include?(:country)).to eq(true)
    expect(forecast_today.include?(:timezone)).to eq(true)
    expect(forecast_today.include?(:time)).to eq(true)
    expect(forecast_today.include?(:icon)).to eq(true)
    expect(forecast_today.include?(:summary)).to eq(true)
    expect(forecast_today.include?(:temperature)).to eq(true)
    expect(forecast_today.include?(:feels_like)).to eq(true)
    expect(forecast_today.include?(:humidity)).to eq(true)
    expect(forecast_today.include?(:visibility)).to eq(true)
    expect(forecast_today.include?(:uv_index)).to eq(true)
    expect(forecast_today.include?(:cloud_cover)).to eq(true)
    expect(forecast_today.include?(:hourly)).to eq(true)
    expect(forecast_today.include?(:daily)).to eq(true)
  end

  it 'returns extended forecast' do

    get '/api/v1/forecast?location=1331+17th+Street+Denver,+CO'

    forecast = JSON.parse(response.body, symbolize_names: true)
    hourly_keys = forecast[:data][:attributes][:hourly][0].keys
    daily_keys = forecast[:data][:attributes][:daily][0].keys

    expect(hourly_keys.include?(:id)).to eq(true)
    expect(hourly_keys.include?(:time)).to eq(true)
    expect(hourly_keys.include?(:temperature)).to eq(true)
    expect(hourly_keys.include?(:icon)).to eq(true)
    expect(hourly_keys.include?(:summary)).to eq(true)
    expect(daily_keys.include?(:id)).to eq(true)
    expect(daily_keys.include?(:time)).to eq(true)
    expect(daily_keys.include?(:high)).to eq(true)
    expect(daily_keys.include?(:low)).to eq(true)
    expect(daily_keys.include?(:icon)).to eq(true)
    expect(daily_keys.include?(:summary)).to eq(true)
    expect(daily_keys.include?(:precip_percent)).to eq(true)
    expect(daily_keys.include?(:precip_type)).to eq(true)
  end
end
