require 'rails_helper'

describe 'Forecast API' do
  it 'returns daily forecast' do

    get '/api/v1/forecast?location=1331+17th+Street,+Denver,+CO'

    forecast = JSON.parse(response.body)
    forecast_daily = forecast[:today][:forecast].keys

    expect(forecast_daily).to have_content('city')
    expect(forecast_daily).to have_content('state')
    expect(forecast_daily).to have_content('time')
    expect(forecast_daily).to have_content('date')
    expect(forecast_daily).to have_content('temperature')
    expect(forecast_daily).to have_content('cloud_cover')
    expect(forecast[:today][:forecast][:temperature].keys).to eq('fahrenheit')
    expect(forecast[:today][:forecast][:temperature].keys).to eq('high')
    expect(forecast[:today][:forecast][:temperature].keys).to eq('low')

    forecast_details = forecast[:details].keys
    expect(forecast_details).to have_content('today')
    expect(forecast_details).to have_content('tonight')
    expect(forecast_details).to have_content('feels_like')
    expect(forecast_details).to have_content('humidity')
    expect(forecast_details).to have_content('visibility')
    expect(forecast_details).to have_content('uv_index')
    expect(forecast_details).to have_content('cloud_cover')
  end

  it 'returns 5 day forecast' do

    get '/api/v1/forecast?location=1331+17th+Street+Denver,+CO'

    forecast = JSON.parse(response.body)
    forecast_extended = forecast[:extended][:forecast]
    forecast_hourly = forecast_extended[:hourly]

    expect(forecast_extended.keys).to have_content('hourly')
    expect(forecast_hourly.keys).to have_content('hour')
    expect(forecast_hourly.keys).to have_content('temperature')
    expect(forecast_hourly[:temperature].keys).to have_content('fahrenheit')
    expect(forecast_extended.keys).to have_content('weekly')
    expect(forecast_extended[:weekly].keys).to have_content('cloud_cover')
    expect(forecast_extended[:weekly].keys).to have_content('precipitation')
    expect(forecast_extended[:weekly].keys).to have_content('high')
    expect(forecast_extended[:weekly].keys).to have_content('low')
  end
end
