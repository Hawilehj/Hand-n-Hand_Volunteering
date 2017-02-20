class Location < ApplicationRecord
  validates :address, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :zipcode, presence: true, length: { maximum: 5 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :organization, presence: true, length: { maximum: 100}
  has_one :job
end
