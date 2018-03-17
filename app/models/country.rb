class Country < ApplicationRecord
  has_many :provinces

  validates :name, presence: true, uniqueness: true
  validates :gst_rate, numericality: true
end
