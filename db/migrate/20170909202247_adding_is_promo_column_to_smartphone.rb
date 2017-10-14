class AddingIsPromoColumnToSmartphone < ActiveRecord::Migration[5.0]
  def change
    add_column :smartphones , :promo, :boolean
  end
end
