class CreateSaleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_details do |t|
      t.integer :smartphone_id
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
