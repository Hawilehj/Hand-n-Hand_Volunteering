class Location < ApplicationRecord
  validates :address, presence: true, length: { maximum: 50 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :zipcode, presence: true, length: { maximum: 5 }
  validates :city, presence: true, length: { maximum: 50 }
  validates :org_name, presence: true, length: { maximum: 100}
  has_many :jobs, dependent: :destroy
  belongs_to :organization
end
