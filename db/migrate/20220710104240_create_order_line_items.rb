class CreateOrderLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_line_items do |t|
      t.integer :order_id

      t.timestamps
    end
  end
end
