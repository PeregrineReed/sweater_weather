class City < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :country
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates :place_id, uniqueness: true, presence: true

  has_many :user_cities
  has_many :users, through: :user_cities

  def self.create_from_hash(data)
    titles = data[:results][0][:address_components]
    coordinates = data[:results][0][:geometry][:location]
    attributes = {
      name: titles[0][:long_name],
      state: titles[2][:short_name],
      country: titles[3][:short_name],
      place_id: data[:results][0][:place_id],
      latitude: coordinates[:lat],
      longitude: coordinates[:lng]
    }
    City.create(attributes)
  end
end
