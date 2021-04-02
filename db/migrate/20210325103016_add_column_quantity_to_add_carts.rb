class AddColumnQuantityToAddCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :add_carts, :quantity, :integer
  end
end
