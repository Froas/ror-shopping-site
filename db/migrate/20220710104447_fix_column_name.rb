class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_items, :order_id, :order_line_id
    
  end
end
