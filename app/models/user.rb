class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates_uniqueness_of :api_key

  has_many :user_cities
  has_many :cities, through: :user_cities

  def self.create_if_valid(params)
    user = User.new(params)
    if user.save && user.update_attribute(:api_key, SecureRandom.urlsafe_base64)
      user
    end
  end
end
