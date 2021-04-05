class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :rating
      t.timestamp :delivery_time

      t.timestamps
    end
  end
end
