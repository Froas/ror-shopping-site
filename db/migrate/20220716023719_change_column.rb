class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :payment_status
    change_column_default :order_items, :status, from: "Shipping soon", to: "Payment is pending"
  end
end
