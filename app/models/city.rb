class City < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :state
  validates_presence_of :country
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates :place_id, uniqueness: true, presence: true

  has_many :user_cities
  has_many :users, through: :user_cities

  def self.find_or_create_from_geocode(location)
    attributes = service(location).city_attributes
    City.create(attributes) unless City.find_by(attributes)
    City.last
  end

  def self.service(location)
    Rails.cache.fetch("geocode-service-#{location}") {
      GeocodeService.new(location)
    }
  end

  def forecast
    Rails.cache.fetch("forecast-#{latitude},#{longitude}") {
      Forecast.new(self, service.forecast)
    }
  end

  def service
    Rails.cache.fetch("weather-service-#{latitude},#{longitude}") {
      WeatherService.new(latitude, longitude)
    }
  end
end
