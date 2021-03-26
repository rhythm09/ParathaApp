class CreateCartParathas < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_parathas do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
