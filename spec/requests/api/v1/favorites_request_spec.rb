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
    city_keys = [:id, :name, :state, :country, :place_id, :latitude, :longitude]
    expect(results[:data][:type]).to eq("favorites")
    expect(results[:data].keys).to eq(favorites_keys)
    expect(results[:data][:attributes].keys).to eq(attribute_keys)
    expect(results[:data][:attributes][:cities][0].keys).to eq(city_keys)
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

    expect(user.cities.count).to eq(2)
    expect(results[:data]).to eq({
      id: 'x',
      type: 'city',
      attributes: {
        id: city.id,
        name: city.name,
        state: city.state,
        country: city.country,
        place_id: city.place_id,
        latitude: city.latitude,
        longitude: city.longitude
      }
    })
  end
end
