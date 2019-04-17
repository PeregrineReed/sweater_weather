require 'rails_helper'

describe 'Favorites API' do
  before :each do
    City.destroy_all
  end
  it 'user can add a favorited city' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    city = create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE')

    post '/api/v1/favorites', params: {
      location: city.place_id,
      api_key: user.api_key
    }.to_json, headers: {
      "Content-Type": "application/json",
       Accept: "application/json"
    }

    expect(response.status).to eq(201)
    expect(user.cities.count).to eq(1)
  end

  it 'user can list their favorite cities' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    user.cities << create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    user.cities << create(:city, place_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    user.cities << create(:city, place_id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    get '/api/v1/favorites', params: {
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }
    results = JSON.parse(response.body, symbolize_names: true)

    favorites_keys = [:id, :type, :attributes]
    attribute_keys = [:cities]
    city_keys = [:location, :current_weather]
    forecast_keys = [:timezone, :time, :icon, :summary, :temperature, :feels_like, :humidity, :visibility, :uv_index, :cloud_cover, :high, :low]
    expect(results[:data][:type]).to eq("favorites")
    expect(results[:data].keys).to eq(favorites_keys)
    expect(results[:data][:attributes].keys).to eq(attribute_keys)
    expect(results[:data][:attributes][:cities][0].keys).to eq(city_keys)
    expect(results[:data][:attributes][:cities][0][:current_weather].keys).to eq(forecast_keys)
  end

  it 'user can delete a favorited city' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    city = create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    user.cities << city
    user.cities << create(:city, place_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    user.cities << create(:city, place_id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    delete '/api/v1/favorites', params: {
      location: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE',
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }

    results = JSON.parse(response.body, symbolize_names: true)

    attr_keys = [:location, :current_weather]
    weather_keys = [:timezone, :time, :icon, :summary, :temperature, :feels_like, :humidity, :visibility, :uv_index, :cloud_cover, :high, :low]
    expect(user.cities.count).to eq(2)
    expect(results[:data].keys).to eq([:id, :type, :attributes])
    expect(results[:data][:attributes].keys).to eq(attr_keys)
    expect(results[:data][:attributes][:current_weather].keys).to eq(weather_keys)
  end

  it 'errors if no api key' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    city = create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    user.cities << city
    user.cities << create(:city, place_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    user.cities << create(:city, place_id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    get '/api/v1/favorites'

    expect(response.status).to eq(401)

    delete '/api/v1/favorites', params: {
      location: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE'
    }

    expect(response.status).to eq(401)
  end
end
