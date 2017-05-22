class Transaction < ApplicationRecord
  belongs_to :toy
  belongs_to :user
  validates :rating, inclusion: { in: [1,2,3, 4, 5], allow_nil: true }
  validates :validated, presence: true
end
