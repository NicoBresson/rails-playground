class Transaction < ApplicationRecord
  belongs_to :toy
  belongs_to :user
end
