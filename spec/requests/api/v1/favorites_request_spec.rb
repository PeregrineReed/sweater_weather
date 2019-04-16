require 'rails_helper'

describe 'Favorites API' do
  it 'user can add a favorited city' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    create(:city, id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE')
    post '/api/v1/favorites', params: {
      favorite: {
        location: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE',
        api_key: 'jgn983hy48thw9begh98h4539h4'
        }
      }

    expect(response.status).to eq(201)
    expect(user.cities.count).to eq(1)
  end

  it 'user can list their favorite cities' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    create(:city, id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    create(:city, id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    create(:city, id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    get '/api/v1/favorites', params: {
      favorite: {
        api_key: 'jgn983hy48thw9begh98h4539h4'
        }
      }

  end
  it 'user can delete a favorited city' do
    user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
    create(:city, id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
    create(:city, id: 'ChIJdd4hrwug2EcRmSrV3Vo6llI', name: 'London')
    create(:city, id: 'ChIJ5TCOcRaYpBIRCmZHTz37sEQ', name: 'Barcelona')

    delete '/api/v1/favorites', params: {
      favorite: {
        location: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE',
        api_key: 'jgn983hy48thw9begh98h4539h4'
        }
      }

    expect(user.cities.count).to eq(2)
  end
end
