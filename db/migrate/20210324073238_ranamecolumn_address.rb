class RanamecolumnAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :string, :city
  end
end
