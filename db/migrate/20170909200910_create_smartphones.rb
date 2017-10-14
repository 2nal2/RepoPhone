class CreateSmartphones < ActiveRecord::Migration[5.0]
  def change
    create_table :smartphones do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :sim
      t.float :ram
      t.string :colors
      t.integer :storage
      t.string :os
      t.string :screen
      t.timestamps
    end
  end
end
