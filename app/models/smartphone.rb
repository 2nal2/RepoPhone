class Smartphone < ApplicationRecord
    has_many :pictures
    attr_accessor :quantity
end
