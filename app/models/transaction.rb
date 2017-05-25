class Transaction < ApplicationRecord
  belongs_to :toy
  belongs_to :user
  after_initialize :init

  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: true }

  def init
    self.rating ||= 0
  end
end
