class AddSaleIdToSaleDetails < ActiveRecord::Migration[5.0]
  def change
      add_column :sale_details, :sale_id, :integer
  end
end
