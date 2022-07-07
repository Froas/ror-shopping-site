class ChangeColumnType2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :quantity, :integer
    remove_column :orders, :total, :integer
    remove_column :orders, :subtotal, :integer
  end
end
