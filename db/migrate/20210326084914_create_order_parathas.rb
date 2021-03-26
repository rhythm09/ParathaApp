class CreateOrderParathas < ActiveRecord::Migration[6.1]
  def change
    create_table :order_parathas do |t|
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
