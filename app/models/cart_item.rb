class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_one :user, through: :cart
end
