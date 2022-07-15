class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_items
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
