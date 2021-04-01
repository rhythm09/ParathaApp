class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.text :address_line_1
      t.text :address_line_2
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
