class DropTableAddCarts < ActiveRecord::Migration[6.1]
  def change
    drop_table :add_carts
  end
end
