class AddReferenceToAddCarts < ActiveRecord::Migration[6.1]
  def change
    add_reference :add_carts, :paratha, foreign_key: true
    add_reference :add_carts, :cart, foreign_key: true
  end
end
