class AddUserIdToCartItem < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :user_id, :integer
  end
end
