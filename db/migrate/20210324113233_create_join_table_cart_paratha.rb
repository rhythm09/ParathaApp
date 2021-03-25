class CreateJoinTableCartParatha < ActiveRecord::Migration[6.1]
  def change
    create_join_table :carts, :parathas do |t|
      # t.index [:cart_id, :paratha_id]
      # t.index [:paratha_id, :cart_id]
      t.integer :quantity
    end
  end
end
