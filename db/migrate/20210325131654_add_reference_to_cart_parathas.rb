class AddReferenceToCartParathas < ActiveRecord::Migration[6.1]
  def change
    add_reference :cart_parathas, :cart, foreign_key: true
    add_reference :cart_parathas, :paratha, foreign_key: true
  end
end
