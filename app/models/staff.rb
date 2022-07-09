class Staff < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  validates :name, presence: true
  validates :email, presence: true
end
