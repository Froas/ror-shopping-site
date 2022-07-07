class User < ApplicationRecord
  has_many :cart_items
  has_one :cart, dependent: :destroy
  # has_many :cart_items, :through => :cart
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
