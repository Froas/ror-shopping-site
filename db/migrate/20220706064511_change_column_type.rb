class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :cart_id, :integer
    change_column :order_items, :cart_id, :integer
  end
end
