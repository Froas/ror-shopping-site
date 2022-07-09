class CartItem < ApplicationRecord
  attr_accessor :item_id
  belongs_to :cart
  belongs_to :product
  has_one :user, through: :cart
end
