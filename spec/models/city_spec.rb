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
end
