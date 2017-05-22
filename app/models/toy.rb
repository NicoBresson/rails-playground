class Toy < ApplicationRecord
  CATEGORY = ["cards", "pogs", "marbles", "other"]
  belongs_to :user
  has_many :transactions
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
