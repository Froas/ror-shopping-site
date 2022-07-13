class User < ApplicationRecord
  has_many :cart_items
  has_one :cart, dependent: :destroy
  has_one :order, dependent: :destroy
  has_many :order_line_items, through: :order
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
     
  validates :name, presence: true
  validates :email, presence: true
end
