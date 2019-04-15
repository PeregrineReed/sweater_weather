require 'rails_helper'

describe 'City' do
  before :each do
    @file = File.read('./fixtures/place.json')
    @data = JSON.parse(@file, symbolize_names: true)
    @city = City.new(@data)
  end
  it 'exists' do
    expect(@city).to be_a(City)
  end

  describe 'attributes' do
    it '#name' do
      expect(@city.name).to eq('Denver')
    end
    it '#state' do
      expect(@city.state).to eq('CO')
    end
    it '#country' do
      expect(@city.country).to eq('US')
    end
    it '#id' do
      expect(@city.id).to eq('ChIJzxcfI6qAa4cR1jaKJ_j0jhE')
    end
    it '#latitude' do
      expect(@city.latitude).to eq(39.7392358)
    end
    it '#longitude' do
      expect(@city.longitude).to eq(-104.990251)
    end
  end
end
