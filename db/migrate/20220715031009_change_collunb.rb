class ChangeCollunb < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_items, :product_id, :ordered_product_id
    remove_column :order_items, :order_id
  end
end
