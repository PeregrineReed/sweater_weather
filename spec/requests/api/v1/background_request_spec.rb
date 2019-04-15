require 'rails_helper'

describe 'Background API' do
  it 'returns a background for the city' do

    get '/api/v1/backgrounds?location=denver,co'

    background = JSON.parse(response.body, symbolize_names: true)
    background_keys = [:image]

    expect(background.keys).to eq(background_keys)
  end

end
