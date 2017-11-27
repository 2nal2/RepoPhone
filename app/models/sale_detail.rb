class SaleDetail < ApplicationRecord
    belongs_to :sales, optional: true
end
