class CreateGoods < ActiveRecord::Migration[7.0]
  def change
    create_table :goods do |t|
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end