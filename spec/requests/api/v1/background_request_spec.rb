require 'rails_helper'

describe 'Background API' do
  it 'returns a background for the city' do

    get '/api/v1/backgrounds?location=denver,co'

    background = JSON.parse(response.body, symbolize_names: true)
    background_keys = [:id, :type, :attributes]
    attribute_keys = [:url, :description, :alt_description]

    expect(background[:data].keys).to eq(background_keys)
    expect(background[:data][:attributes].keys).to eq(attribute_keys)
  end
end
