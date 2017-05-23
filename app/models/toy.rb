class Toy < ApplicationRecord
  CATEGORY = ["cards", "pogs", "marbles", "other"]
  belongs_to :user
  has_many :transactions
  has_attachment :photos, maximum: 2

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
