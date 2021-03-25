class CreateParathas < ActiveRecord::Migration[6.1]
  def change
    create_table :parathas do |t|
      t.string :name
      t.integer :price
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
