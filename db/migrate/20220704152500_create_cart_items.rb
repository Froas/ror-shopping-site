class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.string :cart_id
      t.string :integer
      t.integer :product_id

      t.timestamps
    end
  end
end
