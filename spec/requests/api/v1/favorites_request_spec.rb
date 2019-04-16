require 'rails_helper'

describe 'Favorites API' do
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
    create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    create(:city, place_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    create(:city, place_id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    get '/api/v1/favorites', params: {
      api_key: 'jgn983hy48thw9begh98h4539h4'
    }
    results = JSON.parse(response.body, symbolize_names: true)
    favorites_keys = [:id, :type, :attributes]
    attribute_keys = [:place_id, :name, :state, :country, :latitude, :longitude]
    expect(results[:data][:type]).to eq(:city)
    expect(results[:data].keys).to eq(favorites_keys)
    expect(results[:data][:attributes].keys).to eq(attribute_keys)
  end
  it 'user can delete a favorited city' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    create(:city, place_id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    create(:city, place_id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    delete '/api/v1/favorites', params: {
      favorite: {
        location: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE',
        api_key: 'jgn983hy48thw9begh98h4539h4'
        }
      }

    expect(user.cities.count).to eq(2)
  end
end
