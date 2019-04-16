require 'rails_helper'

describe 'Session API' do
  it 'returns a session in exchange for a registered user\'s email and password' do
    create(:user,
           email: 'user@email.com',
           password: 'password',
           api_key: "WN_7kope0QzswDKpdGGd7Q")

    credentials = {
      email: 'user@email.com',
      password: 'password'
    }

    post '/api/v1/sessions', params: { user: credentials }
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results).to eq({
      api_key: "WN_7kope0QzswDKpdGGd7Q"
      })
  end
end
