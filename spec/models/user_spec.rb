require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :api_key }
  end

  describe 'Relationships' do
    it { should have_many :cities }
  end

  describe 'Class Methods' do
    it '::create_if_valid(params)' do
      yes = {
        email: 'email@valid.com',
        password: 'password'
      }
      no = {
        email: 'email@invalid.com',
        password: nil
      }
      User.create_if_valid(yes)
      User.create_if_valid(no)

      expect(User.count).to eq(1)
      expect(User.last.email).to eq('email@valid.com')
    end
  end

  describe 'Instance Methods' do
    it '#remove_favorite(city)' do
      City.destroy_all
      user = create(:user, api_key: 'jgn983hy48thw9begh98h4539h4')
      city = create(:city, place_id: 'ChIJzxcfI6qAa4cR1jaKJ_j0jhE', name: 'Denver')
      user.cities << city

      user.remove_favorite(city)

      expect(user.cities.count).to eq(0)
    end
  end
end
