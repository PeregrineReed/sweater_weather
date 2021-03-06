require 'rails_helper'

describe 'User API' do
  it 'returns an api_key in exchange for an email and password' do

    credentials = {
      email: 'harry-potter@hogwarts.com',
      password: '#7books&8movies',
      password_confirmation: '#7books&8movies'
    }

    post '/api/v1/users', params: { user: credentials }
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:api_key]).to be_a(String)
    expect(results[:api_key].size).to eq(22)
    expect(User.count).to eq(1)
  end

  it 'returns an error if email and password are invalid or taken' do
    create(:user, email: 'harry-potter@hogwarts.com', password: '#7books&8movies')

    taken_credentials = {
      email: 'harry-potter@hogwarts.com',
      password: '#7books&8movies',
      password_confirmation: '#7books&8movies'
    }
    invalid_username = {
      email: 'hairy-potters-email',
      password: '#7books&8movies',
      password_confirmation: '#7books&8movies'
    }
    invalid_password = {
      email: 'hairy-potters-email',
      password: '#7books&7movies',
      password_confirmation: '#7books&8movies'
    }
    not_saved = {
      error: 'Something went wrong, your account could not be created with those credentials.'
    }

    post '/api/v1/users', params: { user: taken_credentials }
    expect(response.status).to eq(409)

    post '/api/v1/users', params: { user: invalid_username }
    expect(response.status).to eq(409)

    post '/api/v1/users', params: { user: invalid_password }
    expect(response.status).to eq(409)
  end
end
