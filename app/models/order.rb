class Order < ApplicationRecord
  has_many :order_line_items
  has_many :order_items, through: :order_line_items
  belongs_to :user
end


class Order::Create
  def call(cart)
    Order.transaction do
        cart.destroy
      end
  end
end