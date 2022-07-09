class RenameGoodsToProducts < ActiveRecord::Migration[7.0]
  def change
    rename_table :goods, :products
  end
end
