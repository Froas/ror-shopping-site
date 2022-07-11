class OrderItem < ApplicationRecord
  belongs_to :order_line_item
  belongs_to :product
  has_one :order, through: :order_line_item
  # has_one :user, through: :order_line_items, :source => :order

end
