require 'rails_helper'

describe 'Antipode API' do
  it 'returns antipode weather for searched city' do

    get '/api/v1/antipode?loc=hongkong'

    antipode = JSON.parse(response.body, symbolize_names: true)

    antipode_keys = [:id, :type, :attributes]
    attribute_keys = [:location_name, :search_location, :forecast]
    forecast_keys = [:summary, :current_temperature]

    expect(antipode[:data].keys).to eq(antipode_keys)
    expect(antipode[:data][:attributes].keys).to eq(attribute_keys)
    expect(antipode[:data][:attributes][:forecast].keys).to eq(forecast_keys)
  end
end
