class OrderedProduct < ApplicationRecord
  has_one_attached :image
  has_many :order_items
end


class OrderedProduct::Create
  def order(product)
    OrderedProduct.transaction do
      if OrderedProduct.find_by(id: product.id).nil?
        @orderedproduct = OrderedProduct.new(
        id: product.id,
        title: product.title,
        price: product.price,
        description: product.description
        )
        @orderedproduct.save
      end
    end
  end
end