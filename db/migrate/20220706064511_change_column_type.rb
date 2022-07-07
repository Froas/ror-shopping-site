class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :cart_items, :cart_id, :integer
    remove_column :cart_items, :integer, :string
    change_column :order_items, :cart_id, :integer
  end
end
