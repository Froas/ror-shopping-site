class OrderItem < ApplicationRecord
  belongs_to :order_line_items
  belongs_to :order
  belongs_to :product
  # has_one :user, through: :order_line_items, :source => :order

end
