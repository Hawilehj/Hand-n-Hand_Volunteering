class Job < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50}, allow_nil: true
  validates :text, presence: true, length: { maximum: 750}, allow_nil: true
  belongs_to :location
  default_scope -> { order(created_at: :desc)}
end
