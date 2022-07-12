class ChangeDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :order_items, :status, from: "", to: "Shipping soon"
    add_column :order_items, :payment_status, :boolean, :default => false
  end
end
