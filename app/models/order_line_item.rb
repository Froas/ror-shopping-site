class OrderLineItem < ApplicationRecord
  has_many :order_items
  has_one :user, through: :order
  belongs_to :order
end
