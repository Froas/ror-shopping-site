class OrderLineItem < ApplicationRecord
  has_many :order_items
  belongs_to :order
  has_one :user, through: :order
end
