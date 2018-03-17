class Country < ApplicationRecord
  has_many :provinces
  accepts_nested_attributes_for :provinces, allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :gst_rate, numericality: true
end
