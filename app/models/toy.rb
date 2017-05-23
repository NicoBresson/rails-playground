class Toy < ApplicationRecord
  CATEGORY = ["card", "pog", "marble", "other"]
  belongs_to :user
  has_many :transactions
  has_attachments :photos, maximum: 2

  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
