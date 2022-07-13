class ChangeCollum < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_items, :order_line_id, :order_line_item_id
  end
end
