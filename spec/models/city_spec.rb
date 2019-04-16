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
    it '::create_from_hash(data)' do
      file = File.read('./fixtures/place.json')
      data = JSON.parse(file, symbolize_names: true)
      expect(City.create_from_hash(data)).to be_a(City)
    end
  end
end
