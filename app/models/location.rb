class Location < ApplicationRecord
  validates :address, presence: true, length: { maximum: 50 }, allow_nil: true
  validates :state, presence: true, length: { maximum: 2 }, allow_nil: true
  validates :zipcode, presence: true, length: { maximum: 5 }, allow_nil: true
  validates :city, presence: true, length: { maximum: 50 }, allow_nil: true
  validates :org_name, presence: true, length: { maximum: 100}, allow_nil: true
  has_many :jobs, dependent: :destroy
  has_many :users, :through => :jobs
  has_many :organizations, :through => :jobs

end