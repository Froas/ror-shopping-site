class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_one :user, through: :cart
  # has_many :users, through => cart
  #belongs_to :user
  
end
