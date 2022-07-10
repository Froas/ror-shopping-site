class FixColumnName2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_items, :statud, :status
  end
end
