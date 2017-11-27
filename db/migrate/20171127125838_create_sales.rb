class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.integer :user_id

      t.timestamps
    end
  end
end
