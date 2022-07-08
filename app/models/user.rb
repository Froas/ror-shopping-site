class User < ApplicationRecord
  has_many :cart_items
  has_one :cart, dependent: :destroy
  has_one :order, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
