class School < ApplicationRecord
  has_many :users
  has_many :toys, through: :users
  validates :name, presence: true, uniqueness: { scope: :zipcode,
    message: "this school already exists" }
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :country, presence: true

  geocoded_by :complete_address
  after_validation :geocode, if: :address_changed?

  def complete_address
    return "#{self.address}, #{self.zipcode}, #{self.city}, #{self.country}"
  end
end


# a = School.create(name: "test", address: "16 villa gaudelet", zipcode: 75011, city: "paris", country: "france")
