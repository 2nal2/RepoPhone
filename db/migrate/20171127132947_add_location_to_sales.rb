class AddLocationToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :location, :text
  end
end
  