class School < ApplicationRecord
  has_many :users
  has_many :toys, through: :users
  validates :name, presence: true, uniqueness: { scope: :zipcode,
    message: "this school already exists" }
  validates :address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :country, presence: true
end
