class AddReferenceToOrderParatha < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_parathas, :order, foreign_key: true
    add_reference :order_parathas, :paratha, foreign_key: true
  end
end
