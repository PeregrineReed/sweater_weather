require 'rails_helper'

describe City, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
    it { should validate_presence_of :country }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :place_id }
    it { should validate_presence_of :place_id }
    it { should validate_uniqueness_of :place_id }
  end

  describe 'Relationships' do
    it { should have_many :users }
  end

  describe 'Class Methods' do
    it '::find_or_create_from_geocode(data)' do
      expect(City.find_or_create_from_geocode('denver,co')).to be_a(City)
      City.find_or_create_from_geocode('denver,co')
      City.find_or_create_from_geocode('denver,co')
      expect(City.count).to eq(1)
    end

    it '::service' do
      expect(City.service('denver,co')).to be_a(GeocodeService)
    end
  end

  describe 'Instance Methods' do
    it '#service' do
      city = create(:city)

      expect(city.service).to be_a(WeatherService)
    end

    it '::forecast' do
      city = create(:city)

      expect(city.forecast).to be_a(Forecast)
    end
  end
end
