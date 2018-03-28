class Product < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  has_attached_file :image, styles: { large:  '600x600>',
                                            medium: '300x300>',
                                            thumb:  '150x150#' }

  # if a _destroy flag is applied from the Admin dashboard,
  # clear image and all attributes upon successful form submission
  def image_attributes=(attributes)
    image.clear if has_destroy_flag?(attributes) && !image.dirty?
  end

  validates_attachment :image,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  validates :name, :description, :price, :category_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
end
