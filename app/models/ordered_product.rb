class OrderedProduct < ApplicationRecord
end


class OrderedProduct::Create
  def order(product)
    OrderedProduct.transaction do
        @product = Product.find_by(id: product)
        @orderedproduct = Orderedproduct.new(
        title: @product.title,
        price: @product.price,
        description: @product.description
        )
        @orderedproduct.save
      end
  end
end